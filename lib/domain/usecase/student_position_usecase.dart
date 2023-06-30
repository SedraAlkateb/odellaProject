import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class StudentPositionUseCase implements BaseUseCase<StudentPositionUseCaseInput,StudentPosition>{
  Repository _repository;

  StudentPositionUseCase(this._repository);

  @override
  Future<Either<Failure, StudentPosition>> execute(StudentPositionUseCaseInput input) async{
    return await _repository.studentPosition(input.tripId, input.positionId);

  }


}
class StudentPositionUseCaseInput {
  int tripId;
  int positionId;

  StudentPositionUseCaseInput(this.tripId, this.positionId);
}