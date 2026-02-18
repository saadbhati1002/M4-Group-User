/// Base use case interface for domain layer
abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

/// Use case with no parameters
abstract class NoParamsUseCase<Type> {
  Future<Type> call();
}
