
import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class GetAllLostUseCase implements BaseUseCase<Null,LostFound>{
  Repository _repository;
  GetAllLostUseCase(this._repository);

  @override
  Future<Either<Failure, LostFound>> execute(Null input) {
    return _repository.getAllLostFound();
  }

}


