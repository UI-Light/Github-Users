import 'package:flutter/material.dart';
import 'package:github_users/model/user.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:github_users/util/size_util.dart';

class UserTile extends StatelessWidget {
  final User user;

  UserTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  void launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error loading $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: CachedNetworkImage(
            imageBuilder: ((context, imageProvider) {
              return CircleAvatar(
                backgroundImage: imageProvider,
                radius: 25.0,
              );
            }),
            imageUrl: user.profilePic,
            placeholder: (context, url) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(25),
                ),
              );
            }),
        radius: 25.0,
      ),
      title: Text(
        user.name,
      ),
      subtitle: Text(
        user.location,
        style: TextStyle(fontSize: 12.0.w),
      ),
      trailing: Container(
        height: 40.h,
        width: 100.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(width: 2.0.w, color: Color(0xFF757575))),
        child: GestureDetector(
          onTap: () {
            launchURL(user.url);
          },
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              'View Profile',
              style: TextStyle(
                  fontSize: 12.0.sp,
                  color: Color(0xFFBDBDBD),
                  fontWeight: FontWeight.w400),
            ),
            CircleAvatar(
                backgroundImage: AssetImage('assets/github.png'), radius: 8.0),
          ]),
        ),
      ),
    );
  }
}
