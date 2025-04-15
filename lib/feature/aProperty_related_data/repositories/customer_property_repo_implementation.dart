import 'package:zrayo_flutter/core/error/failure.dart';
import 'package:zrayo_flutter/core/utils/dartz/either.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/data_source/customer_property_data_source.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/models/property_agents_list_model.dart';
import 'package:zrayo_flutter/feature/aProperty_related_data/models/property_type_model.dart';

abstract class CustomerPropertyRepository {
  Future<Either<Failure, List<PropertyTypeAndFeaturesModel>>?>
      getPropertyTypesAndFeatures();

  Future<Either<Failure, List<PropertyAgentsListsModel>>?> propertyAgentsList(
      {required Map<String, dynamic> body});
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
        return Right(data?.data ?? <PropertyTypeAndFeaturesModel>[]);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PropertyAgentsListsModel>>?> propertyAgentsList(
      {required Map<String, dynamic> body}) async {
    try {
      final data =
          await customerPropertySource.getPropertyAgentList(body: body);
      if (data?.success == true) {
        return Right(data?.data ?? <PropertyAgentsListsModel>[]);
      } else {
        return Left(ServerFailure(message: data?.message ?? ""));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
