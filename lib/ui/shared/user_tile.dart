import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class UserTile extends StatefulWidget {
  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  final name;
  final location;
  final profilePic;
  final userPage;

  _UserTileState({this.name, this.location, this.profilePic, this.userPage});

  factory _UserTileState.fromJson(Map<String, dynamic> json) {
    return _UserTileState(
      name: json['login'],
      profilePic: json['avatar_url'],
      userPage: json['html_url'],
    );
  }

  Future<_UserTileState> getUsers() async {
    final response = await http
        .get(Uri.parse('https://api.github.com/users?language=flutter'));
    return _UserTileState.fromJson(jsonDecode(response.body));
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    this.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: profilePic,
        radius: 25.0,
      ),
      title: Text(
        name,
      ),
      subtitle: Text(
        'Unavailable',
        style: TextStyle(fontSize: 12.0),
      ),
      trailing: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(width: 2.0, color: Color(0xFF757575))),
        child: GestureDetector(
          onTap: () {
            final url = userPage;
            launchURL(url);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'View Profile',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xFFBDBDBD),
                    fontWeight: FontWeight.w400),
              ),
              CircleAvatar(
                  backgroundImage: AssetImage('assets/github.png'),
                  radius: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
