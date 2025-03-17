import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

///****** Login States *******************
@immutable
sealed class CreateProfileStates extends Equatable {
  const CreateProfileStates();
}
class CreateProfileInitial extends CreateProfileStates{
  @override
  List<Object?> get props => [];

}
