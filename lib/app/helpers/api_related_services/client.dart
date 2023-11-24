import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';

import 'api_failure.dart';
import 'api_response.dart';
import 'apis_endpoint.dart';

final logger = Logger();

enum ApiMethod { get, post, put, delete }

class ApiClient {
  factory ApiClient() {
    return _shared ??= ApiClient._internal();
  }

  ApiClient._internal();

  static String baseURL = ApiEndpoints.baseUrl; // Enter your IP here

  static const int timeout = 40; // seconds
  static String bearerToken = "";

  static Dio dioUnauthrizedClient = Dio(
    BaseOptions(
      baseUrl: baseURL,
      headers: {
        "Connection": "keep-alive",
        "content-encoding": "gzip",
      },
      contentType: 'application/json',
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: timeout),
      connectTimeout: const Duration(seconds: timeout),
      sendTimeout: const Duration(seconds: timeout),
      maxRedirects: 10,
    ),
  )..interceptors.addAll([
      LogInterceptor(),
    ]);

  static Dio dioAuthorizedClient = Dio(
    BaseOptions(
      baseUrl: baseURL,
      headers: {
        "Connection": "keep-alive",
        "content-encoding": "gzip",
      },
      contentType: 'application/json',
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: timeout),
      connectTimeout: const Duration(seconds: timeout),
      sendTimeout: const Duration(seconds: timeout),
      maxRedirects: 10,
    ),
  )..interceptors.addAll([
      LogInterceptor(),
    ]);

  static ApiClient? _shared;

  static ApiClient get sharedInstance {
    return _shared ??= ApiClient._internal();
  }

  static Future<dynamic> apiCall({
    required String path,
    required ApiMethod method,
    bool isUnauthorized = false,
    var payload ,
    dynamic fileData,
    String customBaseUrl = "",
    bool isFullResponse = false,
  }) async {
    try {
      if (!isUnauthorized) {
        // bearerToken = await Get.find<TokenServices>().idToken.toString() ;
      }
      String message =
          "Api Call: Path: $path, Method: $method Payload : $payload";
      logger.d(message);
      Uri url = Uri.parse("$baseURL$path");;
      final client =
          isUnauthorized ? dioUnauthrizedClient : dioAuthorizedClient;
      final response = await client.request(
        url.toString(),
        options: Options(
          contentType: fileData != null
              ? 'multipart/form-data; boundary=<calculated when request is sent>'
              : 'application/json',
          method: method.name.toUpperCase(),
          responseType: ResponseType.json,
          headers: {"Authorization": "Token $bearerToken"},
        ),
        data: fileData ?? payload,
      );
      if (isFullResponse) {
        return ApiResponseOne(
          data: response,
        );
      }
      return ApiResponseOne(
        data: response.data,
      );
    } on DioException catch (e) {
      if (e.error is SocketException) {
        return ApiResponseOne(
          apiFailure: ApiFailure(
            errorResponse: "No Internet Connection",
            errorMessage: "Error",
          ),
        );
      }
      if (e.response?.statusCode == 401) {
        // UserUtils.sharedInstance.logOut();
        return ApiResponseOne(
          apiFailure: ApiFailure(
            errorResponse:
                "Your account has been logged out please login again",
            errorMessage: "Error",
          ),
        );
      }
      String error = "DioError Path: $path, Method: $method Payload : $payload";
      error += "\n";
      error += getErrorFromDioError(e);
      //dont send connection closed error to sentry
      logger.e(error);
      try {
        String error = "Something went wrong";
        if (e.response!.data['errors'] is Map<String, dynamic>) {
          final getErrors = e.response!.data['errors'] as Map<String, dynamic>;
          error = getErrors.entries.toList().first.value[0];
        } else if (e.response!.data['errors'] is String) {
          error = e.response!.data['errors'];
        }
        return ApiResponseOne(
          apiFailure: ApiFailure(
            errorMessage: e.response!.data['message'] ?? "Error",
            errorResponse: error,
            statusCode: e.response!.statusCode?.toString(),
          ),
        );
      } catch (error) {
        return ApiResponseOne(
          apiFailure: ApiFailure(
            errorMessage: error.toString(),
          ),
        );
      }
    } on Exception catch (e) {
      logger.e(e);
      return ApiResponseOne(
        apiFailure: ApiFailure(
          errorMessage: e.toString(),
        ),
      );
    } catch (e) {
      logger.e(e);
      return ApiResponseOne(
        apiFailure: ApiFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  static String getErrorFromDioError(DioException dioError) {
    String str = "Response : ${dioError.response.toString()}";
    str += "\n";
    str += dioError.response?.statusCode?.toString() ?? '';
    str += "\n";
    str += dioError.toString();
    return str;
  }
}
