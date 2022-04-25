import 'package:flutter/material.dart';
import 'package:github_users/ui/shared/user_tile.dart';
import 'package:github_users/domain/model/user.dart';
import 'package:provider/provider.dart';
import 'package:github_users/ui/views/user_view_model.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  _UsersViewState createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  // late final userViewModel = UserViewModel();

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
              context.watch<UserViewModel>().getUsers();
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<List<User>>(
        valueListenable: context.watch<UserViewModel>().users,
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
