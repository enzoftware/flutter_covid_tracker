import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/data/models/summary.dart';
import 'package:flutter_covid_tracker/ui/screens/countries/feed/country_item.dart';
import 'package:flutter_covid_tracker/utils/date_format.dart';

class DetailScreen extends StatelessWidget {
  final CountryData country;

  const DetailScreen({Key key, @required this.country}) : super(key: key);

  static Future navigate(BuildContext context, CountryData countryData) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => DetailScreen(country: countryData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              title: RichText(
                text: TextSpan(
                  text: country.country,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42.0),
              child: RichText(
                text: TextSpan(
                  text: "Until ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                        text: formatDate(DateTime.parse(country.date)),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ))
                  ],
                ),
              ),
            ),
            Hero(
              tag: 'hero-country' + country.countryCode,
              child: CountryItem(countryData: country),
            ),
          ],
        ),
      ),
    );
  }
}
