abstract class DataState<T> {
  const DataState({this.data, this.error});
  final T? data;
  final DataError? error;

  // Static const initial instance for all types
  static const InitialDataState empty = InitialDataState();
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DataError err) : super(error: err);
}

class InitialDataState<T> extends DataState<T> {
  const InitialDataState() : super();
}

class DataError {
  const DataError(this.statusCode, this.error);
  final int? statusCode;
  final dynamic error;
}
