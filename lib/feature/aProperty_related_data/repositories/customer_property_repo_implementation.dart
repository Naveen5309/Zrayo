import 'package:zrayo_flutter/core/error/failure.dart';
import 'package:zrayo_flutter/core/utils/dartz/either.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/data_source/customer_property_data_source.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/models/property_type_model.dart';
import 'package:zrayo_flutter/feature/z_common_widgets/custom_toast.dart';

abstract class CustomerPropertyRepository {
  Future<Either<Failure, List<PropertyTypeAndFeaturesModel>>?>
      getPropertyTypesAndFeatures();
}

class CustomerPropertyRepoImpl implements CustomerPropertyRepository {
  final CustomerPropertyDataSource customerPropertySource;

  CustomerPropertyRepoImpl({required this.customerPropertySource});

  @override
  Future<Either<Failure, List<PropertyTypeAndFeaturesModel>>?>
      getPropertyTypesAndFeatures() async {
    try {
      final data = await customerPropertySource.getPropertyTypesAndFeatures();
      if (data?.success == true) {
        toast(msg: data?.message ?? "", isError: false);

        return Right(data?.data??<PropertyTypeAndFeaturesModel>[]);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
