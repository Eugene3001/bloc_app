import 'package:flutter/material.dart';

abstract class UserState {}

class NoUsersState extends UserState {}

class UsersLoadingState extends UserState {}

class UsersLoadedState extends UserState {
  List<dynamic> loadedUsers;

  UsersLoadedState({@required this.loadedUsers}) : assert(loadedUsers != null);
}
