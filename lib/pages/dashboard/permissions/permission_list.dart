import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sira_base/pages/dashboard/permissions/permission_form.dart';

class PermissionList extends StatefulWidget {
  const PermissionList({Key? key}) : super(key: key);

  @override
  State<PermissionList> createState() => _PermissionListState();
}

class _PermissionListState extends State<PermissionList> {
  BuildContext? dialogContext;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        dialogContext = context;
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          title: const Text('Assigner une permission'),
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;

              return Container(
                height: height - 500,
                width: width - 400,
                child: PermissionForm(dialogContext: dialogContext),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Fermer'),
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
                  label: Text('Permissions accordées'.toUpperCase()),
                ),
              ],
              rows: List<DataRow>.generate(
                  30,
                  (index) => DataRow(cells: [
                        DataCell(Text('A' * (10 - index % 10)), onTap: (() {})),
                        DataCell(Text('B' * (10 - (index + 5) % 10)),
                            onTap: (() {})),
                        DataCell(
                            Row(
                              children: [
                                Chip(
                                  label: Text(
                                    "Modifier Etat",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.yellow,
                                ),
                                Chip(
                                  label: Text("Supprimer Etat",
                                      style: TextStyle(color: Colors.white)),
                                  backgroundColor: Colors.blueAccent,
                                )
                              ],
                            ),
                            onTap: (() {})),
                      ])))
        ],
      ),
    );
  }
}
