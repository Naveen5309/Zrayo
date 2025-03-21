import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

///****** Login States *******************
@immutable
sealed class CustomerSideSearchState extends Equatable {
  const CustomerSideSearchState();
}

class CustomerSideSearchInitial extends CustomerSideSearchState {
  @override
  List<Object> get props => [];
}

class CustomerSideSearchLoading extends CustomerSideSearchState {
  @override
  List<Object> get props => [];
}

class CustomerSideSearchPageRefresh extends CustomerSideSearchState {
  @override
  List<Object> get props => [];
}

class CustomerSideSearchFailed extends CustomerSideSearchState {
  final String error;

  const CustomerSideSearchFailed({required this.error});

  @override
  List<Object> get props => [error];
}
