import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class HomeSupervisorUseCase implements BaseUseCase<String,HomeSuperVisor>{
  Repository _repository;

  HomeSupervisorUseCase(this._repository);

  @override
  Future<Either<Failure, HomeSuperVisor>> execute(String input) async{
    return await _repository.homeSupervisor(input);
  }

}