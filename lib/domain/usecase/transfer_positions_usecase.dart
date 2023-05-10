
import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class TransferPositionsUseCase implements BaseUseCase<Null,TransferPositions>{
  Repository _repository;

  TransferPositionsUseCase(this._repository);

  @override
  Future<Either<Failure, TransferPositions>> execute(Null input) async{
    return await _repository.getTransferPositions();

  }


}