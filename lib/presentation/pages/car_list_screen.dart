import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});
  final List<Car> cars = [
    Car(
        model: "Mercedes Benz",
        distance: 100,
        fuelCapacity: 100,
        pricePerHour: 100),
    Car(model: "BMW", distance: 100, fuelCapacity: 100, pricePerHour: 100),
    Car(model: "Audi", distance: 100, fuelCapacity: 100, pricePerHour: 100),
    Car(model: "Toyota", distance: 100, fuelCapacity: 100, pricePerHour: 100),
    Car(model: "Honda", distance: 100, fuelCapacity: 100, pricePerHour: 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(car: cars[index]);
        },
      ),
    );
  }
}
