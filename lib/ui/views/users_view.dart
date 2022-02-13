import 'package:flutter/material.dart';
import 'package:github_users/ui/shared/user_tile.dart';

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
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 2.0),
        children: [
          UserTile(
            name: 'MichaelAngelo',
            location: 'Unavailable',
            profilePic: AssetImage('assets/saitama.jpg'),
          ),
          UserTile(name: 'Jasmine', location: 'Arabia'),
          UserTile(name: 'Eren Yaeger', location: 'Shiganshina')
        ],
      ),
    );
  }
}
