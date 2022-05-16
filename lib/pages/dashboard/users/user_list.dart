import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sira_base/pages/dashboard/users/user_form.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  var userForm = UserForm();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          title: const Text('AlertDialog Title'),
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;

              return Container(
                height: height - 350,
                width: width - 400,
                child: userForm,
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                await _showMyDialog();
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Nouveau",
                  style: GoogleFonts.lato(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              decoration:
                  BoxDecoration(color: Colors.blueGrey.withOpacity(0.1)),
              headingTextStyle: TextStyle(fontWeight: FontWeight.bold),
              showBottomBorder: true,
              // headingRowColor: Material,
              columns: [
                DataColumn2(
                  label: Text('Nom'.toUpperCase()),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('Prénom'.toUpperCase()),
                ),
                DataColumn(
                  label: Text('Date de naissance'.toUpperCase()),
                ),
                DataColumn(
                  label: Text('Email'.toUpperCase()),
                ),
              ],
              rows: List<DataRow>.generate(
                  30,
                  (index) => DataRow(cells: [
                        DataCell(Text('A' * (10 - index % 10)), onTap: (() {})),
                        DataCell(Text('B' * (10 - (index + 5) % 10)),
                            onTap: (() {})),
                        DataCell(Text('C' * (15 - (index + 5) % 10)),
                            onTap: (() {})),
                        DataCell(Text('D' * (15 - (index + 10) % 10)),
                            onTap: (() {})),
                      ])))
        ],
      ),
    );
  }
}
