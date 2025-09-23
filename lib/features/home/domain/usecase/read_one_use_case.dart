import 'package:skills_xorijdaish/features/home/domain/repository/home_repository.dart';

class ReadOneUseCase {
  final HomeRepository repository;

  ReadOneUseCase(this.repository);

  Future<void> call({required int id}) {
    return repository.readOne(id: id);
  }
}
