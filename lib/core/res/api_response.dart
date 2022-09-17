abstract class ApiResponse<T> {
  final T? data;
  final String? error;

  const ApiResponse(this.data, this.error);
}

class ApiSuccess<T> extends ApiResponse<T> {
  const ApiSuccess(T? data) : super(data, null);
}

class ApiFailed<T> extends ApiResponse<T> {
  const ApiFailed(String error) : super(null, error);
}
