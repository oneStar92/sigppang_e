abstract interface class ViewModel {
  Stream<bool> get isLoadingStream;

  Future<void> initState();
}