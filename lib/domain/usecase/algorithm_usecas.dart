import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class AlgorithmUseCase implements BaseUseCase<Map<String, dynamic>,Algorithm>{
  Repository _repository;
  AlgorithmUseCase(this._repository);

  @override
  Future<Either<Failure, Algorithm>> execute(Map<String, dynamic> input) async{
    return await _repository.algorithm(
       input
    );
  }


}
class AlgorithmUseCaseInput{
  List<int> day_ids;
  List<String> goTimes;
  List<String> returnTimes;

  AlgorithmUseCaseInput(this.day_ids, this.goTimes, this.returnTimes);
}