import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Api/api_client.dart';
import 'BLoC/data_bloc.dart';
import 'BLoC/data_event.dart';
import 'Models/user_model.dart';
import 'Repositories/data_repository.dart';
import 'Screens/user_list_screen.dart';

void main() {
  const baseUrl = 'https://run.mocky.io/v3';
  const endPoint = '02065f24-291c-4609-a300-adefc992f72f';
  const repo = DataRepository(apiClient: ApiClient(baseUrl: baseUrl));
  final bloc = DataBloc(dataFetcher: () => repo.getData<UserModel>(endPoint));

  runApp(
    BlocProvider(
      create: (_) => bloc..add(FetchData<UserModel>()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserListScreen(),
      ),
    ),
  );
}
