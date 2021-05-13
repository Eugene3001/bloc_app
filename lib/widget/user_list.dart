import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_bloc/bloc/user_bloc.dart';
import 'package:users_bloc/bloc/user_state.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is NoUsersState) {
          return Center(
            child: Text('No data.'),
          );
        }

        if (state is UsersLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is UsersLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUsers.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(state.loadedUsers[index].picture)),
                title: Text(
                    state.loadedUsers[index].name +
                        "\n" +
                        state.loadedUsers[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                  state.loadedUsers[index].text,
                  maxLines: 1,
                ),
              );
            },
          );
        }

        return Center(
          child: Text('Error'),
        );
      },
    );
  }
}
