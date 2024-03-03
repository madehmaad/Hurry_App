import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_project/core/domain/model/response_model/regester_model.dart';
import 'package:hurry_project/core/domain/model/response_model/resours_busline_model.dart';
import 'package:hurry_project/core/domain/model/response_model/store_busline_model.dart';
import 'package:hurry_project/core/domain/service/Get/get_verteses.dart';
import 'package:hurry_project/core/resources/colors.dart';
import 'package:hurry_project/views/Admin/store%20Bus%20line/bloc/store_bus_bloc.dart';
import 'package:hurry_project/views/Auth/Sign_up/bloc/sign_up_bloc.dart';
import 'package:hurry_project/views/Home/HomePage.dart';
import 'package:hurry_project/views/widgets/container.dart';
import 'package:hurry_project/views/widgets/text_field.dart';
import 'package:super_rich_text/super_rich_text.dart';

// ignore: must_be_immutable
class StoreBusScreen extends StatelessWidget {
  StoreBusScreen({super.key});

  TextEditingController NameBus = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController cityname = TextEditingController();
  TextEditingController ver1 = TextEditingController();
  TextEditingController ver2 = TextEditingController();
  TextEditingController ver3 = TextEditingController();
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
      child: BlocProvider(
        create: (context) => StoreBloc(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: BlocConsumer<StoreBloc, StoreBusState>(
            listener: (context, state) {
              if (state is LoadingToStoreBus) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(seconds: 3),
                  content: Text('try to store Busline'),
                  backgroundColor: Colors.blue,
                  behavior: SnackBarBehavior.floating,
                ));
              }
              if (state is SuccessStoreBus) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(seconds: 3),
                  content: Text('Success in Storing'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ));
               
              }
              if (state is ErrorInStoreBus || state is ExcptionInStoreBus) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(seconds: 3),
                  content: Text('There is a problem'),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ));
              }
            },
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    MainTextField(
                      context: context,
                      controller: NameBus,
                      labelText: 'Enter Bus name',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    MainTextField(
                      context: context,
                      controller: price,
                      labelText: 'Enter price',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    MainTextField(
                      context: context,
                      controller: cityname,
                      labelText: 'Enter city name',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    MainTextField(
                      context: context,
                      controller: ver1,
                      labelText: 'Enter vertex 1 name',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    MainTextField(
                      context: context,
                      controller: ver2,
                      labelText: 'Enter vertex 2  name',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    MainTextField(
                      context: context,
                      controller: ver3,
                      labelText: 'Enter vertex 3  name',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    MainContainer(
                      context: context,
                      containerText: 'Store Bus line',
                      onTap: () {
                        if (NameBus.text.isNotEmpty && price.text.isNotEmpty) {
                          context.read<StoreBloc>().add(Store(
                                  NewBusLine: PostBuslineModel(
                                      name: NameBus.text,
                                      price: int.parse(price.text),
                                      city_name: cityname.text,
                                      bus_line: [
                                    BusLineModel(
                                        name: ver1.text,
                                        latitude: 33.517432555178466,
                                        longitude: 36.319956857436296),
                                    BusLineModel(
                                        name: ver2.text,
                                        latitude: 33.517432555178466,
                                        longitude: 36.319956857436296),
                                    BusLineModel(
                                        name: ver3.text,
                                        latitude: 33.517432555178466,
                                        longitude: 36.319956857436296)
                                  ])));
                        }
                        if (NameBus.text.isEmpty || price.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            duration: Duration(seconds: 3),
                            content: Text('you need to Enter your data'),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ));
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
