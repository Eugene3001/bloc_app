import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_bloc/bloc/user_bloc.dart';
import 'package:users_bloc/bloc/user_event.dart';

class ActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return Row(
      children: <Widget>[
        IconButton(
          icon: ImageIcon(AssetImage('lib/icon/ic_search_white.png')),
          onPressed: () {
            userBloc.add(UserLoadEvent());
          },
          color: Colors.white,
        ),
        IconButton(
          icon: ImageIcon(AssetImage('lib/icon/ic_check_circle_white.png')),
          onPressed: () => {},
          color: Colors.white,
        ),
      ],
    );
  }
}
