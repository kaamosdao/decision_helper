import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:decision_helper/models/prosandcons_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DiagramPage extends StatelessWidget {
  const DiagramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 300,
          child: BlocBuilder<DecisionBloc, DecisionState>(
            builder: (context, state) {
              List<ProsAndConsData> data = [
                ProsAndConsData(
                  name: 'Pros',
                  count: state.pros.length,
                  label: '+',
                ),
                ProsAndConsData(
                  name: 'Cons',
                  count: state.cons.length,
                  label: '-',
                ),
              ];
              return SfCircularChart(
                title: ChartTitle(text: state.decision),
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                  iconHeight: 18,
                  textStyle: const TextStyle(fontSize: 13),
                  itemPadding: 36,
                ),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <DoughnutSeries<ProsAndConsData, String>>[
                  DoughnutSeries<ProsAndConsData, String>(
                    dataSource: data,
                    xValueMapper: (ProsAndConsData data, _) => data.name,
                    yValueMapper: (ProsAndConsData data, _) => data.count,
                    dataLabelMapper: (ProsAndConsData data, _) => data.label,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    enableTooltip: true,
                  ),
                ],
                palette: const <Color>[
                  Color.fromARGB(255, 99, 217, 238),
                  Color.fromARGB(255, 236, 120, 240),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
