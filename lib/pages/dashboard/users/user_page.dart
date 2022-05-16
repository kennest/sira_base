import 'package:flutter/material.dart';
import 'package:sira_base/pages/dashboard/users/user_form.dart';
import 'package:sira_base/pages/dashboard/users/user_list.dart';
import 'package:sira_base/pages/my_scaffold.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: "/users",
      body: UserList(),
    );
  }
}
