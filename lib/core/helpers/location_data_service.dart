import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:zrayo_flutter/config/assets.dart';
import 'package:zrayo_flutter/feature/auth/data/models/country_state_city_model.dart';

class LocationDataService {
  // Singleton setup
  static final LocationDataService _instance = LocationDataService._internal();

  factory LocationDataService() => _instance;

  LocationDataService._internal();

  // Private variables
  List<Country> _countries = [];
  List<StateModel> _states = [];
  List<City> _cities = [];

  // Public getters
  List<Country> get countries => _countries;

  List<StateModel> get states => _states;

  List<City> get cities => _cities;

  /// Load all location data from assets
  Future<void> loadLocationData() async {
    await Future.wait([
      _loadCountries(),
      _loadStates(),
      _loadCities(),
    ]);
  }

  // Private loading methods
  Future<void> _loadCountries() async {
    final jsonString = await rootBundle.loadString(Assets.countryJson);
    final jsonList = json.decode(jsonString) as List<dynamic>;
    _countries = _parseCountries(jsonList);
  }

  Future<void> _loadStates() async {
    final jsonString = await rootBundle.loadString(Assets.stateJson);
    final jsonList = json.decode(jsonString) as List<dynamic>;
    _states = _parseStates(jsonList);
  }

  Future<void> _loadCities() async {
    final jsonString = await rootBundle.loadString(Assets.cityJson);
    final jsonList = json.decode(jsonString) as List<dynamic>;
    _cities = _parseCities(jsonList);
  }

  // Private parsers
  List<Country> _parseCountries(List<dynamic> jsonList) {
    return jsonList.map((json) => Country.fromJson(json)).toList();
  }

  List<StateModel> _parseStates(List<dynamic> jsonList) {
    return jsonList.map((json) => StateModel.fromJson(json)).toList();
  }

  List<City> _parseCities(List<dynamic> jsonList) {
    return jsonList.map((json) => City.fromJson(json)).toList();
  }
}
