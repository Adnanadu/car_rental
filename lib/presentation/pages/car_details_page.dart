import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/presentation/pages/maps_details_page.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:car_rental/presentation/widgets/more_card.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatefulWidget {
  final Car car;

  const CarDetailsPage({super.key, required this.car});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    _controller!.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text("Information"),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          CarCard(
              car: Car(
                  model: "Bmw",
                  distance: 13000,
                  fuelCapacity: 6,
                  pricePerHour: 500)),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                //User Information
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/images/user.jpg'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Adnan",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("\$4,253",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 20,
                ),
                //Map
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MapsDetailsPage(
                          car: widget.car,
                        );
                      }));
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/maps.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                    car: Car(
                        model: "${widget.car.model}-1",
                        distance: widget.car.distance + 100,
                        fuelCapacity: widget.car.fuelCapacity,
                        pricePerHour: widget.car.pricePerHour)),
                SizedBox(
                  height: 5,
                ),
                MoreCard(
                    car: Car(
                        model: "${widget.car.model}-2",
                        distance: widget.car.distance + 250,
                        fuelCapacity: widget.car.fuelCapacity,
                        pricePerHour: widget.car.pricePerHour)),
                SizedBox(
                  height: 5,
                ),
                MoreCard(
                    car: Car(
                        model: "${widget.car.model}-3",
                        distance: widget.car.distance + 340,
                        fuelCapacity: widget.car.fuelCapacity,
                        pricePerHour: widget.car.pricePerHour)),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
