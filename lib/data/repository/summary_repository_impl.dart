import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_covid_tracker/data/models/summary.dart';
import 'package:flutter_covid_tracker/data/repository/summary_repository.dart';

class SummaryRepositoryImplementation extends SummaryRepository {
  @override
  Future<SummaryData> retrieveSummaryData() async {
    const apiUrl = "https://api.covid19api.com/summary";
    var response = await http.get(apiUrl);
    print(response.body);
    return SummaryData.fromJson(json.decode(response.body));
  }
}
