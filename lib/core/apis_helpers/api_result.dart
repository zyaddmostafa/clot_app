sealed class ApiResult<T> {
  const ApiResult();

  R when<R>({
    required R Function(T data) success,
    required R Function(String message) error,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else if (this is Error<T>) {
      return error((this as Error<T>).message);
    }
    throw Exception('Invalid ApiResult type');
  }
}

class Success<T> extends ApiResult<T> {
  final T data;

  const Success(this.data);
}

class Error<T> extends ApiResult<T> {
  final String message;

  const Error(this.message);
}
