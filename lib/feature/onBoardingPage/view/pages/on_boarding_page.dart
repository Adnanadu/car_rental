import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bmw_1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                spacing: 10,
                children: [
                  Text("Premium Cars \nEnjoy the Luxury",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                  Text(
                      "Premium and Presticious cars for rental \nExpertise the thrill at a lower price",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 318,
                    height: 54,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white),
                        child: Text("Let's Go",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
