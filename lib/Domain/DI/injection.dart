import 'package:booking_app/Core/API/Network/repository.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerFactory(() => AppBloc(
        repository: di(),
      ));

  di.registerLazySingleton<DioHelper>(
    () => DioImplementation(),
  );

  di.registerLazySingleton<Repository>(
    () => RepositoryImplementation(
      dioHelper: di(),
    ),
  );
}
