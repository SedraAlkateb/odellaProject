import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class LocationUseCase implements BaseUseCase<int,Location>{
  Repository _repository;

  LocationUseCase(this._repository);

  @override
  Future<Either<Failure, Location>> execute(int input) async{
    return await _repository.getLocationById(input);

  }


}