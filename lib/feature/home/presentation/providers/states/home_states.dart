import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

///****** Login States *******************
@immutable
sealed class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomePageRefresh extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeFailed extends HomeState {
  final String error;

  const HomeFailed({required this.error});

  @override
  List<Object> get props => [error];
}
