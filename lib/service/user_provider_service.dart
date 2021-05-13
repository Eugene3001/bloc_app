import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:users_bloc/model/user.dart';

class UserProviderService {
  final USERS_URL =
      "https://raw.githubusercontent.com/vyatsykiv/Flutter-Task/main/users.json";

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(USERS_URL));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Cannot connect to: ' + USERS_URL);
    }
  }
}
