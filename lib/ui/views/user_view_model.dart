import 'package:flutter/material.dart';
import 'package:github_users/data/respository/user_repository.dart';
import 'package:github_users/domain/model/user.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel() {
    getUsers();
  }
  final userRepository = UserRepository();

  ValueNotifier<List<User>> _users = ValueNotifier([]);
  ValueNotifier<List<User>> get users => _users;

  Future<void> getUsers() async {
    try {
      final result = await userRepository.getUsers();
      _users.value = result;
    } catch (e) {}
    notifyListeners();
  }
}
