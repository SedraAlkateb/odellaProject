import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class TransportationLinesUseCase implements BaseUseCase<Null,TransportationLines>{
  Repository _repository;

  TransportationLinesUseCase(this._repository);

  @override
  Future<Either<Failure, TransportationLines>> execute(Null input) async{
    return await _repository.getTransportationLines();

  }


}