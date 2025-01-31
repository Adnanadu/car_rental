import 'package:car_rental/presentation/bloc/car_bloc.dart';
import 'package:car_rental/presentation/bloc/car_state.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class CarListScreen extends StatelessWidget {
//   CarListScreen({super.key});
//   final List<Car> cars = [
//     Car(
//         distance: 100,
//         fuelCapacity: 100,
//         model: "Fortuner GR",
//         pricePerHour: 100),
//     Car(
//         model: "Fortuner GR",
//         distance: 100,
//         fuelCapacity: 100,
//         pricePerHour: 100),
//     Car(
//         model: "Fortuner GR",
//         distance: 100,
//         fuelCapacity: 100,
//         pricePerHour: 100),
//     Car(
//         model: "Fortuner GR",
//         distance: 100,
//         fuelCapacity: 100,
//         pricePerHour: 100),
//     Car(
//         model: "Fortuner GR",
//         distance: 100,
//         fuelCapacity: 100,
//         pricePerHour: 100),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView.builder(
//         itemCount: cars.length,
//         itemBuilder: (context, index) {
//           return CarCard(car: cars[index]);
//         },
//       ),
//     );
//   }
// }

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CarsLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                return CarCard(car: state.cars[index]);
              },
            );
          } else if (state is CarsError) {
            return Center(
              child: Text('error : ${state.message}'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
