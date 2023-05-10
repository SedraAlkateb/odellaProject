import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';

import 'base_usecase.dart';

class UniversitiesUsecase implements BaseUseCase<Null,Universities>{
  Repository _repository;
  UniversitiesUsecase(this._repository);
  @override
  Future<Either<Failure, Universities>> execute(Null) async{
    return await _repository.getUniversities();
  }

}



