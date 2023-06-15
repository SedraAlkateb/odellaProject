
import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

import '../../data/network/failure.dart';

class RefreshUseCase implements BaseUseCase<Null,Authentication>{
  Repository _repository;

  RefreshUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(Null input) async{
    return await _repository.refresh();
  }


}
