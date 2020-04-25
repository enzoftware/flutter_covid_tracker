import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/data/models/summary.dart';
import 'package:flutter_covid_tracker/ui/widgets/item_country_text.dart';

class CountryItem extends StatefulWidget {
  final CountryData countryData;
  final VoidCallback onCountryTapped;

  const CountryItem({Key key, @required this.countryData, this.onCountryTapped})
      : super(key: key);

  @override
  _CountryItemState createState() => _CountryItemState();
}

class _CountryItemState extends State<CountryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: widget.onCountryTapped,
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
                    "${widget.countryData.country} (${widget.countryData.countryCode}) - ${widget.countryData.newConfirmed} new cases",
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
                      quantity: widget.countryData.totalConfirmed,
                      description: 'Confirmed',
                      colorQuantity: Colors.yellow,
                    ),
                    ItemCountryText(
                      quantity: widget.countryData.totalRecovered,
                      description: 'Recovered',
                      colorQuantity: Colors.green,
                    ),
                    ItemCountryText(
                      quantity: widget.countryData.totalDeaths,
                      description: 'Death',
                      colorQuantity: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
