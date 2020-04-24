import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/providers/summary_bloc.dart';
import 'package:flutter_covid_tracker/ui/screens/countries/feed/feed_screen.dart';
import 'package:flutter_covid_tracker/ui/screens/world/world_stats_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: Text("Covid-19 Tracker"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.flag)),
              Tab(icon: Icon(Icons.assessment)),
            ],
          ),
        ),
        body: ChangeNotifierProvider(
          child: HomeBody(),
          create: (_) {
            final summaryBloc = SummaryBloc();
            summaryBloc.fetchSummary();
            return summaryBloc;
          },
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final summaryBloc = Provider.of<SummaryBloc>(context);
    if (summaryBloc.summary == null) {
      return Center(child: CircularProgressIndicator());
    }

    return TabBarView(
      children: [
        CountriesScreen(countries: summaryBloc.summary.countries),
        WorldScreen(),
      ],
    );
  }
}
