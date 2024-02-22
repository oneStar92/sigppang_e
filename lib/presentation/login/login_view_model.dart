import 'package:rxdart/rxdart.dart';
import 'package:sigppang_e/presentation/common/view_model.dart';

final class LoginViewModel implements ViewModel {
  final PublishSubject<bool> _isLoadingSubject = PublishSubject();

  @override
  Future<void> initState() => Future.value();

  @override
  Stream<bool> get isLoadingStream => _isLoadingSubject.stream;
}