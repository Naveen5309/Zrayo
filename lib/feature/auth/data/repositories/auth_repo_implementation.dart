import 'dart:io';

import 'package:zrayo_flutter/core/error/failure.dart';
import 'package:zrayo_flutter/core/utils/dartz/either.dart';
import 'package:zrayo_flutter/feature/auth/data/data_source/auth_data_source.dart';
import 'package:zrayo_flutter/feature/auth/data/models/user_model.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel?>> doLogin(
      {required Map<String, dynamic> body});

  Future<Either<Failure, UserModel?>> getProfile();

  Future<Either<Failure, UserModel?>> doSignUp(
      {required Map<String, dynamic> body});

  Future<Either<Failure, UserModel?>> createUpdateProfile({
    required Map<String, dynamic> body,
    required bool isUpdateCall,
  });

  Future<Either<Failure, dynamic>> uploadDocument({
    File? frontSide,
    File? backSide,
  });

  Future<Either<Failure, dynamic>> addAddress(
      {required Map<String, dynamic> body});

  Future<Either<Failure, UserModel?>> addBankDetails(
      {required Map<String, dynamic> body});

  Future<Either<Failure, UserModel?>> forgotPassword(
      {required Map<String, dynamic> body});

  Future<Either<Failure, UserModel?>> changePassword(
      {required Map<String, dynamic> body});

  Future<Either<Failure, UserModel?>> verifyEmail(
      {required Map<String, dynamic> body});
}

class AuthRepoImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, UserModel?>> getProfile() async {
    try {
      final data = await dataSource.getProfile();
      if (data?.success == true) {
        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> doLogin(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.logInUser(body: body);
      if (data?.success == true) {
        toast(msg: data?.message ?? "", isError: false);

        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> doSignUp(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.signUpUser(body: body);
      if (data?.success == true) {
        toast(msg: data?.message ?? "", isError: false);
        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> createUpdateProfile(
      {required Map<String, dynamic> body, required bool isUpdateCall}) async {
    try {
      final data = await dataSource.createUpdateProfile(
          body: body, isUpdateCall: isUpdateCall);
      if (data?.success == true) {
        toast(msg: data?.message ?? "", isError: false);
        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> uploadDocument({
    File? frontSide,
    File? backSide,
  }) async {
    try {
      final data = await dataSource.uploadDocument(
          frontSide: frontSide, backSide: backSide);
      if (data?.success == true) {
        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addAddress(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.addAddress(body: body);
      if (data?.success == true) {
        toast(msg: data?.message ?? "", isError: false);
        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> addBankDetails(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.addBankDetails(body: body);
      if (data?.success == true) {
        toast(msg: data?.message ?? "", isError: false);
        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> verifyEmail(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.verifyEmail(body: body);
      if (data?.success == true) {
        toast(msg: data?.message ?? "", isError: false);
        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> forgotPassword(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.forgetPassword(body: body);
      if (data?.success == true) {
        toast(msg: data?.message ?? "", isError: false);
        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> changePassword(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.changePassword(body: body);
      if (data?.success == true) {
        toast(msg: data?.message ?? "", isError: false);
        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
