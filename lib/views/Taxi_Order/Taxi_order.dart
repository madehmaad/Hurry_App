import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_project/core/domain/model/request_model/orders_model.dart';
import 'package:hurry_project/core/domain/model/response_model/join_order_model.dart';
import 'package:hurry_project/core/domain/model/response_model/verteses_model.dart';
import 'package:hurry_project/core/domain/service/Get/get_pendings.dart';
import 'package:hurry_project/core/domain/service/Get/get_verteses.dart';
import 'package:hurry_project/core/domain/service/Post/join_order_service.dart';
import 'package:hurry_project/core/resources/colors.dart';
import 'package:hurry_project/views/Taxi_Order/New_order/New_order.dart';
import 'package:hurry_project/views/Taxi_Order/New_order/bloc/Taxi_pen_bloc.dart';
import 'package:hurry_project/views/widgets/autocomplete.dart';
import 'package:hurry_project/views/widgets/container.dart';
import 'package:super_rich_text/super_rich_text.dart';

TextEditingController order = TextEditingController();

class TaxiScreen extends StatelessWidget {
  const TaxiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PendBloc(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: BlocConsumer<PendBloc, PendState>(
          listener: (context, state) {
            if (state is SuccessPend) {
              showModalBottomSheet(
                  context: context,
                  builder: ((context) {
                    return Container(
                      height: MediaQuery.sizeOf(context).height / 2,
                      color: MainColor().bottonColor,
                      child: Column(
                        children: [
                          SuperRichText(
                            text: 'Pending Orders',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height / 20,
                          ),
                          (ord.isNotEmpty || ord == [])
                              ? Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width /
                                          1.1,
                                      height:
                                          MediaQuery.sizeOf(context).height / 5,
                                      child: ListView.separated(
                                          itemBuilder: (context, index) =>
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          elevation: 1,
                                                          title: Text(
                                                              'Join the Trip'),
                                                          titleTextStyle:
                                                              TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20),
                                                          actionsOverflowButtonSpacing:
                                                              20,
                                                          actions: [
                                                            ElevatedButton(
                                                                style: ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateColor.resolveWith((states) =>
                                                                            MainColor()
                                                                                .bottonColor)),
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                  showModalBottomSheet(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Container(
                                                                            decoration:
                                                                                ShapeDecoration(
                                                                              color: MainColor().bottonColor,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(20),
                                                                              ),
                                                                              shadows: const [
                                                                                BoxShadow(
                                                                                  color: Color(0x3F000000),
                                                                                  blurRadius: 26,
                                                                                  offset: Offset(0, 0),
                                                                                  spreadRadius: 0,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            height: MediaQuery.sizeOf(context).height /
                                                                                2,
                                                                            child:
                                                                                Column(children: [
                                                                              SuperRichText(
                                                                                text: 'Join an Order',
                                                                                style: const TextStyle(
                                                                                  color: Color.fromARGB(255, 16, 15, 15),
                                                                                  fontSize: 30,
                                                                                  fontWeight: FontWeight.w800,
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: MediaQuery.sizeOf(context).height / 20,
                                                                              ),
                                                                              FutureBuilder(
                                                                                  future: JoinOrderService().joinOrder(model: JoinOrderModel(orderId: ord[index].id, numOfPeople: 1)),
                                                                                  builder: (context, snap) {
                                                                                    if (snap.hasData) {
                                                                                      if (snap.data is OrdersModel) {
                                                                                        return Text('Joined Trip succesfully!', style: TextStyle(color: Color.fromARGB(255, 5, 139, 16), fontSize: 25, fontWeight: FontWeight.w700));
                                                                                      } else {
                                                                                        return Text('You are already in this order!', style: TextStyle(color: Color.fromARGB(255, 217, 9, 16), fontSize: 25, fontWeight: FontWeight.w700));
                                                                                      }
                                                                                    } else if (snap.connectionState == ConnectionState.waiting) {
                                                                                      return CircularProgressIndicator(
                                                                                        backgroundColor: MainColor().bottonColor,
                                                                                      );
                                                                                    } else {
                                                                                      return Text(
                                                                                        'There is a problem',
                                                                                        style: TextStyle(color: Colors.white),
                                                                                      );
                                                                                    }
                                                                                  })
                                                                            ]));
                                                                      });
                                                                },
                                                                child: Text(
                                                                    "Yes")),
                                                            ElevatedButton(
                                                                style: ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateColor.resolveWith((states) =>
                                                                            Colors
                                                                                .red)),
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Text("No")),
                                                          ],
                                                          content: Text(
                                                              "Are you sure to join this trip?"),
                                                        );
                                                      });
                                                },
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height /
                                                          10,
                                                  decoration: ShapeDecoration(
                                                    color: Color.fromARGB(
                                                        224, 227, 225, 225),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  child: ListTile(
                                                    // subtitle: Text(ord[index].destination_vertices_id.toString()),
                                                    title: Text(
                                                        ver[index + 1].name),

                                                    subtitle: Text(ord[index]
                                                            .current_passenger_count
                                                            .toString() +
                                                        ' / ' +
                                                        ord[index]
                                                            .top_passenger_count
                                                            .toString()),
                                                    // leading: Text('is hurry: ' +
                                                    //     ord[index]
                                                    //         .is_hurry
                                                    //         .toString()),
                                                    trailing: Text(
                                                      "gender: " +
                                                          ord[index].genders,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 154, 9, 45)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          separatorBuilder: (context, index) =>
                                              Divider(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height /
                                                        110,
                                                color: Colors.transparent,
                                              ),
                                          itemCount: ord.length),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: InkWell(
                                        onTap: () {
                                          vertesesModel sorceid = ver
                                              .where((element) =>
                                                  element.name == order.text)
                                              .first;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewOrderScreen(
                                                        source: sorceid.id,
                                                      )));
                                        },
                                        child: Container(
                                          decoration: ShapeDecoration(
                                            color: const Color.fromARGB(
                                                255, 73, 73, 72),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            shadows: const [
                                              BoxShadow(
                                                color: Color(0x3F000000),
                                                blurRadius: 26,
                                                offset: Offset(0, 0),
                                                spreadRadius: 0,
                                              ),
                                            ],
                                          ),
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  2,
                                          height: MediaQuery.sizeOf(context)
                                                  .height /
                                              15,
                                          child: Center(
                                            child: Text(
                                              'Make New Order',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        'No Pending Order Now... :(',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(30),
                                      child: InkWell(
                                        onTap: () {
                                          vertesesModel sorceid = ver
                                              .where((element) =>
                                                  element.name == order.text)
                                              .first;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewOrderScreen(
                                                        source: sorceid.id,
                                                      )));
                                        },
                                        child: Container(
                                          decoration: ShapeDecoration(
                                            color: const Color.fromARGB(
                                                255, 73, 73, 72),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            shadows: const [
                                              BoxShadow(
                                                color: Color(0x3F000000),
                                                blurRadius: 26,
                                                offset: Offset(0, 0),
                                                spreadRadius: 0,
                                              ),
                                            ],
                                          ),
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  2,
                                          height: MediaQuery.sizeOf(context)
                                                  .height /
                                              15,
                                          child: Center(
                                            child: Text(
                                              'Make New Order',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                        ],
                      ),
                    );
                  }));
            } else if (state is ErrorPend || state is ExcptionPend) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(seconds: 5),
                content: Text('There is a problem'),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ));
            }
          },
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  SuperRichText(
                    text: 'r lli ill d e',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                    ),
                    othersMarkers: [
                      MarkerText(
                        marker: 'll',
                        style: TextStyle(
                          color: MainColor().bottonColor,
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SuperRichText(
                    text: 'nnTnnaxi',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                    ),
                    othersMarkers: [
                      MarkerText(
                        marker: 'nn',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 20,
                  ),
                  FutureBuilder(
                      future: VertesesService().getVerteses(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Center(
                            child: Column(
                              children: [
                                SearchAuto(
                                    reg: Bus,
                                    label: 'current Location',
                                    controller: order),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30,
                                ),
                                MainContainer(
                                    context: context,
                                    containerText: 'Show Pending Orders',
                                    onTap: () {
                                      if (order.text.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          duration: Duration(seconds: 3),
                                          content: Text(
                                              'you need to Enter Destinations'),
                                          backgroundColor: Colors.red,
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                      } else {
                                        vertesesModel sorceid = ver
                                            .where((element) =>
                                                element.name == order.text)
                                            .first;
                                        context
                                            .read<PendBloc>()
                                            .add(Pending(source: sorceid.id));
                                      }
                                    }),
                                (state is LoadingPend)
                                    ? SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height /
                                                3,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: MainColor().bottonColor,
                                          ),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          );
                        } else {
                          return Container(
                              height: MediaQuery.of(context).size.height / 2,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: MainColor().bottonColor,
                              )));
                        }
                      })
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
