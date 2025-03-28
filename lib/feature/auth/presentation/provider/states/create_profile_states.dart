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
  @override
  List<Object> get props => [];
}

class CreateProfileSuccess extends CreateProfileStates {
  @override
  List<Object> get props => [];
}

class CreateProfileFailed extends CreateProfileStates {
  final String error;

  const CreateProfileFailed({required this.error});

  @override
  List<Object> get props => [error];
}
