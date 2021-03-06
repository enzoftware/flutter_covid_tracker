import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/data/models/summary.dart';
import 'package:flutter_covid_tracker/ui/screens/countries/detail/detail_screen.dart';
import 'package:flutter_covid_tracker/ui/screens/countries/feed/country_item.dart';

class CountriesScreen extends StatefulWidget {
  final List<CountryData> countries;

  const CountriesScreen({Key key, @required this.countries}) : super(key: key);

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<CountryData> countries;

  @override
  void initState() {
    countries = widget.countries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo[800],
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) => Hero(
            key: UniqueKey(),
            tag: 'hero-country' + countries[index].countryCode,
            child: CountryItem(
              countryData: countries[index],
              onCountryTapped: () => DetailScreen.navigate(
                context,
                countries[index],
              ),
            ),
          ),
          itemCount: countries.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            countries.sort((a, b) => b.totalConfirmed - a.totalConfirmed);
            setState(() {});
          },
          child: Icon(Icons.filter_list),
        ),
      ),
    );
  }
}
