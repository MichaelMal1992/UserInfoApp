import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_info_app/Models/user_model.dart';
import 'package:user_info_app/Screens/user_details_screen.dart';

import '../BLoC/data_bloc.dart';
import '../BLoC/data_event.dart';
import '../BLoC/data_state.dart';

class UserListScreen extends StatelessWidget {
  final title = 'Users';

  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: BlocBuilder<DataBloc<UserModel>, DataState<UserModel>>(
          builder: (context, state) {
            if (state is DataInitial<UserModel> ||
                state is DataLoading<UserModel>) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is DataLoaded<UserModel>) {
              return RefreshIndicator(
                onRefresh: () async {
                  final dataBloc = context.read<DataBloc<UserModel>>();
                  dataBloc.add(FetchData<UserModel>());
                },
                child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    final user = state.data[index];
                    return ListTile(
                      title: Text(user.name ?? ""),
                      subtitle: Text(user.email ?? ""),
                      onTap: () => _pushDetailsScreen(context, user),
                    );
                  },
                ),
              );
            } else if (state is DataError<UserModel>) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }

  void _pushDetailsScreen(BuildContext context, UserModel user) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => UserDetailScreen(user)),
    );
  }
}
