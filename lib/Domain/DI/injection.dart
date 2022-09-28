import 'package:booking_app/Application/Cubit/cubit.dart';
import 'package:booking_app/Domain/API/Network/dioHelper.dart';
import 'package:booking_app/Domain/API/Network/repository.dart';
import 'package:get_it/get_it.dart';

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
