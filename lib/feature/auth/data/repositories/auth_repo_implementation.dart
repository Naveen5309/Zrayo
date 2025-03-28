import 'package:zrayo_flutter/core/error/failure.dart';
import 'package:zrayo_flutter/core/utils/dartz/either.dart';
import 'package:zrayo_flutter/feature/auth/data/data_source/auth_data_source.dart';
import 'package:zrayo_flutter/feature/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel?>> doLogin(
      {required Map<String, dynamic> body});
  Future<Either<Failure, UserModel?>> doSignUp(
      {required Map<String, dynamic> body});
  Future<Either<Failure, UserModel?>> createProfile(
      {required Map<String, dynamic> body});
  Future<Either<Failure, UserModel?>> addAddress(
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
  Future<Either<Failure, UserModel?>> doLogin(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.logInUser(body: body);
      if (data?.status == true) {
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
      if (data?.status == true) {
        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> createProfile(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.createProfile(body: body);
      if (data?.status == true) {
        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> addAddress(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.addAddress(body: body);
      if (data?.status == true) {
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
      if (data?.status == true) {
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
      if (data?.status == true) {
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
      if (data?.status == true) {
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
      if (data?.status == true) {
        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
