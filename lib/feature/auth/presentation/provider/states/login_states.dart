import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:zrayo_flutter/feature/auth/data/models/user_model.dart';

///****** Login States *******************
@immutable
sealed class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginApiLoading extends LoginState {
  final String? route;

  const LoginApiLoading({this.route});

  @override
  List<Object?> get props => [route];
}

class OtpResendApiLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final UserModel? userModel;

  const LoginSuccess({this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class ChangePasswordSuccess extends LoginState {
  @override
  List<Object> get props => [];
}

class OtpSentSuccess extends LoginState {
  @override
  List<Object> get props => [];
}

class OtpVerifySuccess extends LoginState {
  @override
  List<Object> get props => [];
}

class OtpSuccessfullySend extends LoginState {
  @override
  List<Object> get props => [];
}

class UpdateTimer extends LoginState {
  final int secondsRemaining;
  final bool enableResend;

  const UpdateTimer(
      {required this.secondsRemaining, required this.enableResend});

  @override
  List<Object?> get props => [];
}

class LoginFailed extends LoginState {
  final String error;

  const LoginFailed({required this.error});

  @override
  List<Object> get props => [error];
}

///****** SignUp States *******************
@immutable
sealed class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpApiLoading extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpSuccess extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpFailed extends SignUpState {
  final String error;

  const SignUpFailed({required this.error});

  @override
  List<Object> get props => [error];
}
