import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

///****** Login States *******************
@immutable
sealed class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitial extends DashboardState {
  @override
  List<Object> get props => [];
}
class DashboardLoading extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardChangeTabSuccess extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardFailed extends DashboardState {
  final String error;

  const DashboardFailed({required this.error});

  @override
  List<Object> get props => [error];
}
