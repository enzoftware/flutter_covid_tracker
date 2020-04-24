import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/data/models/summary.dart';
import 'package:flutter_covid_tracker/ui/widgets/item_country_text.dart';

class CountryItem extends StatelessWidget {
  final CountryData countryData;

  const CountryItem({Key key, @required this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.indigo[900],
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${countryData.country} (${countryData.countryCode}) - ${countryData.newConfirmed} new cases",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ItemCountryText(
                    quantity: countryData.totalConfirmed,
                    description: 'Confirmed',
                    colorQuantity: Colors.yellow,
                  ),
                  ItemCountryText(
                    quantity: countryData.totalRecovered,
                    description: 'Recovered',
                    colorQuantity: Colors.green,
                  ),
                  ItemCountryText(
                    quantity: countryData.totalDeaths,
                    description: 'Death',
                    colorQuantity: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
