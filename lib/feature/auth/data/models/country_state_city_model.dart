import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Models (same as before)
class Country {
  final String id;
  final String sortname;
  final String name;
  final String phonecode;

  Country({
    required this.id,
    required this.sortname,
    required this.name,
    required this.phonecode,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      sortname: json['sortname'],
      name: json['name'],
      phonecode: json['phonecode'],
    );
  }
}

class StateModel {
  final String id;
  final String name;
  final String countryId;

  StateModel({
    required this.id,
    required this.name,
    required this.countryId,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['id'],
      name: json['name'],
      countryId: json['country_id'],
    );
  }
}

class City {
  final String id;
  final String name;
  final String stateId;

  City({
    required this.id,
    required this.name,
    required this.stateId,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      stateId: json['state_id'],
    );
  }
}

