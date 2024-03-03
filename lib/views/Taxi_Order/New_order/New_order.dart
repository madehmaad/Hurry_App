import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_project/core/domain/model/request_model/New_order_model.dart';
import 'package:hurry_project/core/domain/model/response_model/verteses_model.dart';
import 'package:hurry_project/core/domain/service/Get/get_verteses.dart';
import 'package:hurry_project/core/resources/colors.dart';
import 'package:hurry_project/views/Taxi_Order/bloc/New_order_bloc.dart';
import 'package:hurry_project/views/widgets/autocomplete.dart';
import 'package:hurry_project/views/widgets/container.dart';
import 'package:super_rich_text/super_rich_text.dart';

// ignore: must_be_immutable
class NewOrderScreen extends StatefulWidget {
  NewOrderScreen({super.key, required this.source});
  int source;

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  TextEditingController to = TextEditingController();
  String dropValue = 'both';

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
        create: (context) => NewBloc(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: BlocConsumer<NewBloc, NewState>(
            listener: (context, state) {
              if (state is LoadingNew) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(seconds: 3),
                  content: Text('Ordering New Taxi...'),
                  backgroundColor: Colors.blue,
                  behavior: SnackBarBehavior.floating,
                ));
              }
              if (state is SuccessNew) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(seconds: 3),
                  content: Text('Order added succesfully!'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ));
              }
              if (state is ErrorNew || state is ExcptionNew) {
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
                    SearchAuto(
                        reg: Bus,
                        label: 'where are you going?',
                        controller: to),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 14,
                    ),
                    DropdownButton<String>(
                        dropdownColor: Colors.black,
                        value: dropValue,
                        style: TextStyle(color: Colors.white),
                        items: [
                          DropdownMenuItem(
                            value: 'Male',
                            child: Text('Male'),
                          ),
                          DropdownMenuItem(
                            value: 'Female',
                            child: Text('Female'),
                          ),
                          DropdownMenuItem(
                            value: 'both',
                            child: Text('both'),
                          )
                        ],
                        onChanged: (String? newvalue) {
                          setState(() {
                            dropValue = newvalue!;
                          });
                        }),
                    MainContainer(
                      context: context,
                      containerText: 'Order riide Taxi',
                      onTap: () {
                        vertesesModel sorceid = ver
                            .where((element) => element.name == to.text)
                            .first;
                        if (dropValue.isNotEmpty && to.text.isNotEmpty) {
                         
                          context.read<NewBloc>().add(Ordering(
                              New: NewOrdersModel(
                                  top_passenger_count: 4,
                                  current_passenger_count: 1,
                                  destination_vertices_id: sorceid.id,
                                  source_vertices_id: widget.source,
                                  is_hurry: true,
                                  genders: dropValue)));
                        }
                        if (dropValue.isEmpty || to.text.isEmpty) {
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
