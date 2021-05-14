import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_bloc/bloc/user_bloc.dart';
import 'package:users_bloc/bloc/user_state.dart';
import 'package:users_bloc/repository/user_repository.dart';
import 'package:users_bloc/widget/action_button.dart';
import 'package:users_bloc/widget/user_list.dart';

class HomePage extends StatelessWidget {
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(userRepository),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Inbox"),
          actions: <Widget>[
            ActionButton(),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: UserList()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => {},
            child: ImageIcon(
              AssetImage("lib/icon/ic_add_black.png"),
              color: Colors.black,
            ),
            backgroundColor: Colors.cyanAccent),
      ),
    );
  }
}
