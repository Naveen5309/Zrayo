import 'package:zrayo_flutter/core/error/failure.dart';
import 'package:zrayo_flutter/core/utils/dartz/either.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/data_source/customer_property_data_source.dart';
import 'package:zrayo_flutter/feature/auth/data/models/user_model.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

abstract class CustomerPropertyRepository {
  Future<Either<Failure, UserModel?>> createProperty(
      {required Map<String, dynamic> body});
}

class CustomerPropertyRepoImpl implements CustomerPropertyRepository {
  final CustomerPropertyDataSource customerPropertySource;

  CustomerPropertyRepoImpl({required this.customerPropertySource});

  @override
  Future<Either<Failure, UserModel?>> createProperty(
      {required Map<String, dynamic> body}) async {
    try {
      final data = await customerPropertySource.createProperty(body: body);
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
