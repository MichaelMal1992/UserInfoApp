import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'data_event.dart';
import 'data_state.dart';

typedef DataFetcher<T> = Future<List<T>> Function();

class DataBloc<T> extends Bloc<DataEvent<T>, DataState<T>> {
  final DataFetcher<T> dataFetcher;

  DataBloc({required this.dataFetcher}) : super(DataInitial()) {
    on<FetchData<T>>(_fetchData);
  }

  FutureOr<void> _fetchData(
    FetchData<T> event,
    Emitter<DataState<T>> emit,
  ) async {
    emit(DataLoading<T>());
    try {
      final data = await dataFetcher();
      emit(DataLoaded<T>(data: data));
    } catch (e) {
      emit(DataError<T>(message: e.toString()));
    }
  }
}
