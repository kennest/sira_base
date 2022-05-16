import 'package:flutter/material.dart';
import 'package:sira_base/pages/dashboard/permissions/permission_list.dart';
import 'package:sira_base/pages/my_scaffold.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({Key? key}) : super(key: key);

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: "/permissions",
      body: PermissionList(),
    );
  }
}
