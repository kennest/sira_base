import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/rendering.dart';

/// Example without a datasource
class DataTable2SimpleDemo extends StatelessWidget {
  DataTable2SimpleDemo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.1)),
          headingTextStyle: TextStyle(fontWeight: FontWeight.bold),
          showBottomBorder: true,
          // headingRowColor: Material,
          columns: [
            DataColumn2(
              label: Text('Column A'.toUpperCase()),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: Text('Column B'.toUpperCase()),
            ),
            DataColumn(
              label: Text('Column C'.toUpperCase()),
            ),
            DataColumn(
              label: Text('Column D'.toUpperCase()),
            ),
            DataColumn(
              label: Text('Column NUMBERS'.toUpperCase()),
              numeric: true,
            ),
          ],
          rows: List<DataRow>.generate(
              30,
              (index) => DataRow(cells: [
                    DataCell(Text('A' * (10 - index % 10)), onTap: (() {
                      Get.snackbar("Row Selected", "Success");
                    })),
                    DataCell(Text('B' * (10 - (index + 5) % 10)), onTap: (() {
                      Get.snackbar("Row Selected", "Success");
                    })),
                    DataCell(Text('C' * (15 - (index + 5) % 10)), onTap: (() {
                      Get.snackbar("Row Selected", "Success");
                    })),
                    DataCell(Text('D' * (15 - (index + 10) % 10)), onTap: (() {
                      Get.snackbar("Row Selected", "Success");
                    })),
                    DataCell(Text(((index + 0.1) * 25.4).toString()),
                        onTap: (() {
                      Get.snackbar("Row Selected", "Success");
                    }))
                  ]))),
    );
  }
}
