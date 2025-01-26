import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});
  final List<Car> cars = [
    Car(
        model: "Mercedes Benz",
        distance: 100,
        fuelCapacity: 7,
        pricePerHour: 45),
    Car(model: "BMW", distance: 100, fuelCapacity: 6, pricePerHour: 50),
    Car(model: "Audi", distance: 100, fuelCapacity: 8, pricePerHour: 40),
    Car(model: "Toyota", distance: 100, fuelCapacity: 13, pricePerHour: 15),
    Car(model: "Honda", distance: 100, fuelCapacity: 18, pricePerHour: 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Your Car"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(car: cars[index]);
        },
      ),
    );
  }
}
