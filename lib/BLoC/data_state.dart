abstract class DataState<T> {
  const DataState();
}

class DataInitial<T> extends DataState<T> {}

class DataLoading<T> extends DataState<T> {}

class DataLoaded<T> extends DataState<T> {
  final List<T> data;

  const DataLoaded({required this.data});
}

class DataError<T> extends DataState<T> {
  final String message;

  const DataError({required this.message});
}
