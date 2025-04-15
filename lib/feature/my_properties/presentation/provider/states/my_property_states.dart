
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

///****** My Property States *******************
@immutable
sealed class MyPropertyState extends Equatable {
  const MyPropertyState();
}

class MyPropertyInitial extends MyPropertyState {
  @override
  List<Object> get props => [];
}


class MyPropertyApiLoading extends MyPropertyState {
  final String? route;

  const MyPropertyApiLoading({this.route});

  @override
  List<Object?> get props => [route];
}

class MyPropertyRefresh extends MyPropertyState {
  @override
  List<Object> get props => [];
}

class MyPropertyFailed extends MyPropertyState {
  final String error;

  const MyPropertyFailed({required this.error});

  @override
  List<Object> get props => [error];
}
