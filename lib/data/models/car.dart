import 'package:freezed_annotation/freezed_annotation.dart';

part 'car.freezed.dart';
part 'car.g.dart';

@freezed
class Car with _$Car {
  const factory Car({
    required num distance,
    required num fuelCapacity,
    required String model,
    required num pricePerHour,
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
}
