abstract interface class UseCase<T, U> {
  T execute({required U query});
}