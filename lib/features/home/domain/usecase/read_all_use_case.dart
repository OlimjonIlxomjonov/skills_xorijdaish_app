import 'package:skills_xorijdaish/features/home/domain/repository/home_repository.dart';

class ReadAllUseCase {
  final HomeRepository repository;

  ReadAllUseCase(this.repository);

  Future<void> call() {
    return repository.readAll();
  }
}
