import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_users/ui/views/user_view_model.dart';
import 'package:github_users/ui/views/users_view.dart';
import 'package:github_users/util/size_util.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => Provider(
        create: ((context) => UserViewModel()),
        child: MaterialApp(
          useInheritedMediaQuery: true,
          builder: (context, child) {
            SizeUtil.init(context);
            return child!;
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(), //primarySwatch: Colors.black),
          home: UsersView(),
        ),
      ),
    ),
  );
}
