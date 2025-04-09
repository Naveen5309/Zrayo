import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

///****** Login States *******************
@immutable
sealed class CreateProfileStates extends Equatable {
  const CreateProfileStates();
}

class CreateProfileInitial extends CreateProfileStates {
  @override
  List<Object?> get props => [];
}

class CreateProfileApiLoading extends CreateProfileStates {
  final String? route;

  const CreateProfileApiLoading({this.route});

  @override
  List<Object?> get props => [route];
}

class CreateProfileSuccess extends CreateProfileStates {
  @override
  List<Object> get props => [];
}

class UploadDocSuccess extends CreateProfileStates {
  @override
  List<Object> get props => [];
}

class AddressSuccess extends CreateProfileStates {
  @override
  List<Object> get props => [];
}

class BankSuccess extends CreateProfileStates {
  @override
  List<Object> get props => [];
}

class CreateProfileRefresh extends CreateProfileStates {
  @override
  List<Object> get props => [];
}

class CreateProfileFailed extends CreateProfileStates {
  final String error;

  const CreateProfileFailed({required this.error});

  @override
  List<Object> get props => [error];
}
