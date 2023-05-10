


import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class PositionLineUseCase implements BaseUseCase<int,PositionLine>{
  Repository _repository;

  PositionLineUseCase(this._repository);

  @override
  Future<Either<Failure, PositionLine>> execute(int input) async{
    return await _repository.positionLine(input);

  }



}
