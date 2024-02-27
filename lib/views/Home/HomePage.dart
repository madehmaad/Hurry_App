import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_project/core/config/get_it.dart';
import 'package:hurry_project/core/resources/colors.dart';
import 'package:hurry_project/views/Auth/Sign_in/bloc/sign_in_bloc.dart';
import 'package:hurry_project/views/Bus_way/Bus_way.dart';
import 'package:hurry_project/views/Taxi_Order/Taxi_order.dart';
import 'package:hurry_project/views/widgets/container.dart';
import 'package:hurry_project/views/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_rich_text/super_rich_text.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          tileMode: TileMode.repeated,
          colors: [
            Color.fromARGB(255, 7, 25, 19),
            Colors.black,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              SuperRichText(
                text: 'llWllelcome llTllo',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
                othersMarkers: [
                  MarkerText(
                    marker: 'll',
                    style: TextStyle(
                      color: MainColor().bottonColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SuperRichText(
                text: 'r lli ill d e',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                ),
                othersMarkers: [
                  MarkerText(
                    marker: 'll',
                    style: TextStyle(
                      color: MainColor().bottonColor,
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              // Text(
              //   'Hello ',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 17,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TaxiScreen()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 5,
                  child: Image.asset('assets/taxi.png'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BusWayScreen()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 5,
                  child: Image.asset('assets/bus.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
