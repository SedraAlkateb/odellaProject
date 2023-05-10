import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class CitiesUseCase implements BaseUseCase<Null,Cities>{
  Repository _repository;

  CitiesUseCase(this._repository);

  @override
  Future<Either<Failure, Cities>> execute(Null input) async{
    return await _repository.getCities();

  }


}