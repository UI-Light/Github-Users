import 'package:flutter/material.dart';
import 'package:github_users/ui/shared/user_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  _UsersViewState createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
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
              //final url = userPage;
              //launchURL(url);
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 2.0),
        children: [
          UserTile(),
        ],
      ),
    );
  }
}
