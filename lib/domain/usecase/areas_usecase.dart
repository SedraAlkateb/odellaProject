import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class AreasUseCase implements BaseUseCase<int,Areas>{
  Repository _repository;

  AreasUseCase(this._repository);

  @override
  Future<Either<Failure, Areas>> execute(int input) async{
    return await _repository.getAreasByCityId(input);

  }


}