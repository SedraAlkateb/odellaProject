import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class DenyUseCase implements BaseUseCase<int,AcceptDenyModel>{
  Repository _repository;
  DenyUseCase(this._repository);

  @override
  Future<Either<Failure, AcceptDenyModel>> execute(int input) async{
    return await _repository.deny(input);
  }


}
