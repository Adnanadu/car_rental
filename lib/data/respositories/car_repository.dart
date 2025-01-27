import 'package:car_rental/data/datasoureces/firebase_car_data_source.dart';
import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/domain/repositories/car_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class CarRepositoryImpl implements CarRepository{
final FirebaseCarDataSource dataSource;

CarRepositoryImpl({required this.dataSource});

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }

}