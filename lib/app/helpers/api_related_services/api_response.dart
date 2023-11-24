
import 'api_failure.dart';

class ApiResponseOne<T> {
  final T? data;
  final ApiFailure? apiFailure;
  ApiResponseOne({
    this.data,
    this.apiFailure,
  });
}
