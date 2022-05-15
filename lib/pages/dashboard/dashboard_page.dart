import 'package:flutter/material.dart';
import 'package:sira_base/pages/my_scaffold.dart';
import 'package:sira_base/widgets/data_table.dart';
import 'package:sira_base/widgets/line_chart.dart';
import 'package:sira_base/widgets/pie_chart.dart';
import 'package:sira_base/widgets/radar_chart.dart';

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
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              LimitedBox(
                maxHeight: MediaQuery.of(context).size.height / 2,
                maxWidth: MediaQuery.of(context).size.width / 2,
                child: PieChartSample1(),
              ),
              Expanded(
                child: LineChartSample1(),
              )
            ],
          ),
          Row(
            children: [
              LimitedBox(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width / 2,
                child: RadarChartSample1(),
              ),
            ],
          ),
          Wrap(
            children: [
              LimitedBox(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width,
                child: DataTable2SimpleDemo(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
