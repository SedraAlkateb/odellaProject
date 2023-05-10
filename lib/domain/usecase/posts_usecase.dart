import 'package:dartz/dartz.dart';

import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';

import 'base_usecase.dart';

class PostsUseCase implements BaseUseCase<void,PostModel>{
  Repository _repository;
  PostsUseCase(this._repository);
  @override
  Future<Either<Failure, PostModel>> execute(void input) async{
    return await _repository.posts();
  }

  }



