import 'package:flutter/material.dart';
import 'package:github_users/data/respository/user_repository.dart';
import 'package:github_users/domain/model/user.dart';
import 'package:github_users/domain/user_domain.dart';

class UserViewModel {
  //Depend on the domain relevant to the view model
  final userDomain = UserDomain(UserRepository());

  //Expose a getter that retrieves the required data from the domain
  ValueNotifier<List<User>> get users => userDomain.users;

  //This calls getUsers in the domain and is required
  //because the UI needs to do a refresh
  //typically you'd handle errors here and show them in your UI
  Future<void> getUsers() async {
    try {
      await userDomain.getUsers();
    } catch (e) {
      //handle error
      //show error in view
    }
  }
}
