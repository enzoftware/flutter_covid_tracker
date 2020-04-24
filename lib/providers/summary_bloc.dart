import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/data/models/summary.dart';
import 'package:flutter_covid_tracker/data/repository/summary_repository.dart';
import 'package:flutter_covid_tracker/data/repository/summary_repository_impl.dart';

class SummaryBloc extends ChangeNotifier {
  SummaryData _summary;
  SummaryData get summary => _summary;

  SummaryRepository repository = SummaryRepositoryImplementation();

  Future<void> fetchSummary() async {
    if (_summary != null) return _summary;
    return refetchSummary();
  }

  Future<void> refetchSummary() async {
    try {
      _summary = await repository.retrieveSummaryData();
    } catch (e) {
      print("ERROR : ${e.toString()}");
      throw Exception(e);
    }
    notifyListeners();
  }

  void sortCountriesByConfirmedCases() {}
}
