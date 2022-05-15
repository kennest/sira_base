import 'package:flutter/material.dart';
import 'package:sira_base/pages/my_scaffold.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: "/dash",
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
