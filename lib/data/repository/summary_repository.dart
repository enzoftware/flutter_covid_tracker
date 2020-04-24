import 'package:flutter_covid_tracker/data/models/summary.dart';

abstract class SummaryRepository {
  Future<SummaryData> retrieveSummaryData();
}
