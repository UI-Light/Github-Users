import 'package:github_users/domain/model/user.dart';

abstract class Repository {
  Future<List<User>> getUsers();
}
