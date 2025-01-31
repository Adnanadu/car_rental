import 'package:car_rental/data/datasoureces/firebase_car_data_source.dart';
import 'package:car_rental/data/respositories/car_repository.dart';
import 'package:car_rental/domain/repositories/car_repository.dart';
import 'package:car_rental/domain/usecases/get_cars.dart';
import 'package:car_rental/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerSingleton(() => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(
      () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()),
    );
    getIt.registerLazySingleton<CarRepository>(
      () => CarRepositoryImpl(getIt<FirebaseCarDataSource>()),
    );
    getIt.registerLazySingleton<GetCars>(
      () => GetCars(getIt<CarRepository>()),
    );
    getIt.registerFactory(
      () => CarBloc(getCars: getIt<GetCars>()),
    );
  } catch (e) {
    rethrow;
  }
}
