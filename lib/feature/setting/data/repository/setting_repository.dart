import 'package:zrayo_flutter/core/error/failure.dart';
import 'package:zrayo_flutter/core/utils/dartz/either.dart';
import 'package:zrayo_flutter/feature/auth/data/models/user_model.dart';
import 'package:zrayo_flutter/feature/setting/data/data_source/setting_data_source.dart';

abstract class SettingRepository {
  Future<Either<Failure, UserModel?>> contactUs(
      {required Map<String, dynamic> body});
}

class SettingRepoImpl implements SettingRepository {
  final SettingDataSource dataSource;

  SettingRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, UserModel?>> contactUs(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await dataSource.contactUs(body: body);
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
