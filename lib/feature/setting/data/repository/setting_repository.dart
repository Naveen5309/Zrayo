import 'package:zrayo_flutter/core/error/failure.dart';
import 'package:zrayo_flutter/core/utils/dartz/either.dart';
import 'package:zrayo_flutter/feature/setting/data/data_source/setting_data_source.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

abstract class SettingRepository {
  Future<Either<Failure, dynamic>> contactUs(
      {required Map<String, dynamic> body});

  Future<Either<Failure, dynamic>> logout({required Map<String, dynamic> body});

  Future<Either<Failure, dynamic>> aboutUs(
      {required Map<String, dynamic> body});

  Future<Either<Failure, dynamic>> notificationStatusChange(
      {required Map<String, dynamic> body});
}

class SettingRepoImpl implements SettingRepository {
  final SettingDataSource dataSource;

  SettingRepoImpl({required this.dataSource});

  ///Contact Us
  @override
  Future<Either<Failure, dynamic>> contactUs(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.contactUs(body: body);
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

  /// NOTIFICATION STATUS CHANGE
  @override
  Future<Either<Failure, dynamic>> notificationStatusChange(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.notificationStatusChange(body: body);
      if (data?.success == true) {
        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  ///Logout

  @override
  Future<Either<Failure, dynamic>> logout(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.logout(body: body);
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

  /// About Us

  @override
  Future<Either<Failure, dynamic>> aboutUs(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.aboutUs(body: body);
      if (data?.success == true) {
        return Right(data?.data);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
