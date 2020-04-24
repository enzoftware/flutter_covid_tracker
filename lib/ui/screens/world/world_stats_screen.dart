import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/data/models/summary.dart';
import 'package:flutter_covid_tracker/ui/widgets/global_stats_text.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WorldScreen extends StatelessWidget {
  final GlobalData globalData;

  const WorldScreen({Key key, @required this.globalData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Global stats',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue[900],
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GlobalStatsText(
                      description: "New confirmed: ",
                      value: globalData.newConfirmed,
                    ),
                    GlobalStatsText(
                      description: "Total confirmed: ",
                      value: globalData.totalConfirmed,
                    ),
                    GlobalStatsText(
                      description: "New recovered: ",
                      value: globalData.newRecovered,
                    ),
                    GlobalStatsText(
                      description: "Total recovered: ",
                      value: globalData.totalRecovered,
                    ),
                    GlobalStatsText(
                      description: "New deaths: ",
                      value: globalData.newDeaths,
                    ),
                    GlobalStatsText(
                      description: "Total deaths: ",
                      value: globalData.totalDeaths,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
