import 'package:flutter/material.dart';
import 'package:github_users/ui/shared/user_tile.dart';
import 'package:github_users/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:github_users/util/size_util.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  _UsersViewState createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  List users = [];

  Future<void> getUsers() async {
    final response = await http
        .get(Uri.parse('https://api.github.com/users?language=flutter'));
    final usersApi = jsonDecode(response.body);
    setState(() {
      users = usersApi;
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'GitHub Users',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              getUsers();
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 2.0.w),
        children: [
          for (var user in users)
            UserTile(
              user: User.fromJson(user),
            )
        ],
      ),
    );
  }
}
