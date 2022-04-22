import 'package:flutter/material.dart';
import 'package:github_users/ui/shared/user_tile.dart';
import 'package:github_users/model/user.dart';
import 'package:github_users/ui/views/user_view_model.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  _UsersViewState createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  late final userViewModel = UserViewModel();

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
              userViewModel.getUsers();
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<List<User>>(
        valueListenable: userViewModel.users,
        builder: (_, users, __) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 2.0),
            children: [
              for (var user in users)
                UserTile(
                  user: user,
                )
            ],
          );
        },
      ),
    );
  }
}
