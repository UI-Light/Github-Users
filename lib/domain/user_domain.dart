import 'package:flutter/material.dart';
import 'package:github_users/domain/model/user.dart';
import 'package:github_users/domain/repository.dart';

class UserDomain {
  final Repository repository;

  //call getUsers in the constructor to automatically get users
  //immediately a UserDomain instance is constructed
  UserDomain(this.repository) {
    getUsers();
  }

  //Use value notifiers to notify view models/views of changes in values
  ValueNotifier<List<User>> _users = ValueNotifier([]);
  ValueNotifier<List<User>> get users => _users;

  //get users from repository and set the value of the corresponding value notifier
  Future<void> getUsers() async {
    _users.value = await repository.getUsers();
  }
}
