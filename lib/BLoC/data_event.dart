abstract class DataEvent<T> {
  const DataEvent();
}

class FetchData<T> extends DataEvent<T> {}
