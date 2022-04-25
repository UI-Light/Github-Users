import 'package:github_users/data/http_service.dart';
import 'package:github_users/domain/model/user.dart';
import 'package:github_users/domain/repository.dart';

class UserRepository implements Repository {
  late HttpService _httpService;

  UserRepository({HttpService? httpService}) {
    _httpService = httpService ?? HttpService();
  }

  Future<List<User>> getUsers() async {
    final userListJson = await _httpService.get("users?language=flutter");

    List<User> users = List<User>.from(
      userListJson["data"].map(
        (user) => User.fromJson(user),
      ),
    );

    return users;
  }
}
