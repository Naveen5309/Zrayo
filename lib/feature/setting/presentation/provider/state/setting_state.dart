import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

///****** Setting States *******************
@immutable
sealed class SettingState extends Equatable {
  const SettingState();
}

class SettingInitial extends SettingState {
  @override
  List<Object?> get props => [];
}

class SettingApiLoading extends SettingState {
  @override
  List<Object> get props => [];
}

class SettingSuccess extends SettingState {
  @override
  List<Object> get props => [];
}

class SettingFailed extends SettingState {
  final String error;

  const SettingFailed({required this.error});

  @override
  List<Object> get props => [error];
}
