import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_bloc/bloc/user_event.dart';
import 'package:users_bloc/bloc/user_state.dart';
import 'package:users_bloc/model/user.dart';
import 'package:users_bloc/repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(initialState, this.userRepository) : super(NoUsersState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    yield UsersLoadingState();

    try {
      final List<User> users = await userRepository.getUsers();
      yield UsersLoadedState(loadedUsers: users);
    } catch (_) {
      yield NoUsersState();
    }
  }
}
