import 'package:sigppang_e/domain/model/custom_date_time.dart';
import 'package:sigppang_e/domain/model/to_do.dart';
import 'package:sigppang_e/domain/repository/to_do_repository.dart';
import 'package:sigppang_e/domain/use_case/use_case.dart';

final class FirebaseToDoReadUseCase implements UseCase<Stream<Map<CustomDateTime, List<ToDo>>>, void> {
  final ToDoRepository _repository;

  const FirebaseToDoReadUseCase({
    required ToDoRepository repository,
  }) : _repository = repository;

  @override
  Stream<Map<CustomDateTime, List<ToDo>>> execute({required void query}) {
    return _repository.readAll().map(
      (event) {
        return event.fold(
          <CustomDateTime, List<ToDo>>{},
          (previousValue, element) => previousValue
            ..update(
              CustomDateTime.from(element.createdAt),
              (value) => value..add(element),
              ifAbsent: () => [element],
            ),
        );
      },
    );
  }
}
