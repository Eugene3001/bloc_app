import 'package:users_bloc/model/user.dart';
import 'package:users_bloc/service/user_provider_service.dart';

class UserRepository {
  UserProviderService _usersProvider = UserProviderService();

  Future<List<User>> getUsers() => _usersProvider.getUsers();
}
