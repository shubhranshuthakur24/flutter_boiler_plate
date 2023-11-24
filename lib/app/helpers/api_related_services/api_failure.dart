// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ApiFailure {
  final String? errorMessage;
  final String? statusCode;
  final String errorResponse;
  ApiFailure({
    required this.errorMessage,
    this.statusCode,
    this.errorResponse = "",
  });

  ApiFailure copyWith({
    String? errorMessage,
    String? statusCode,
    dynamic errorResponse,
  }) {
    return ApiFailure(
      errorMessage: errorMessage ?? this.errorMessage,
      statusCode: statusCode ?? this.statusCode,
      errorResponse: errorResponse ?? this.errorResponse,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'errorMessage': errorMessage,
      'statusCode': statusCode,
      'errorResponse': errorResponse,
    };
  }

  factory ApiFailure.fromMap(Map<String, dynamic> map) {
    return ApiFailure(
      errorMessage: map['errorMessage'] ?? "",
      statusCode: map['statusCode'] as String,
      errorResponse: map['errorResponse'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiFailure.fromJson(String source) =>
      ApiFailure.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ApiFailure(errorMessage: $errorMessage, statusCode: $statusCode, errorResponse: $errorResponse)';

  @override
  bool operator ==(covariant ApiFailure other) {
    if (identical(this, other)) return true;

    return other.errorMessage == errorMessage &&
        other.statusCode == statusCode &&
        other.errorResponse == errorResponse;
  }

  @override
  int get hashCode =>
      errorMessage.hashCode ^ statusCode.hashCode ^ errorResponse.hashCode;
}
