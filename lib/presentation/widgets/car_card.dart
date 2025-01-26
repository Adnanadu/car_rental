import 'package:car_rental/data/models/car.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Image.asset(
            'assets/images/bmw_1.jpg',
            height: 120,
          ),
          Text(car.model,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/gps.png"),
                      Text("${car.distance.toStringAsFixed(0)}km")
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/pump.png"),
                      Text("${car.fuelCapacity.toStringAsFixed(0)}km")
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
