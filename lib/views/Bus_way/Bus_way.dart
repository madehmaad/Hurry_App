import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_project/core/domain/model/request_model/shortest_path_model.dart';
import 'package:hurry_project/core/domain/model/response_model/resours_busline_model.dart';
import 'package:hurry_project/core/domain/model/response_model/verteses_model.dart';
import 'package:hurry_project/core/domain/service/Get/get_buslines.dart';
import 'package:hurry_project/core/domain/service/Get/get_verteses.dart';
import 'package:hurry_project/core/resources/colors.dart';
import 'package:hurry_project/views/Bus_way/bloc/Short_bloc.dart';
import 'package:hurry_project/views/widgets/autocomplete.dart';
import 'package:hurry_project/views/widgets/container.dart';
import 'package:super_rich_text/super_rich_text.dart';

TextEditingController source = TextEditingController();
TextEditingController target = TextEditingController();
List<vertesesModel> vert = [];
List<ResoursBusLineModel> Busliness = [];

class BusWayScreen extends StatelessWidget {
  BusWayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShortBloc(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BlocConsumer<ShortBloc, ShortState>(
            listener: (context, state) {
              if (state is SuccessShort) {
                vert.clear();
                for (var i = 0; i < vertices.length; i++) {
                  if (vertices[i] != -1) {
                    vertesesModel vertx =
                        ver.where((element) => element.id == vertices[i]).first;
                    vert.add(vertx);
                    ResoursBusLineModel busl = Buslines.where(
                        (element) => element.id == vertx.bus_line_id).first;
                    Busliness.add(busl);

                    // (index) => ver
                    //     .where((element) => (element.id == vertices[index]))
                    //     .first;
                  } else if (vertices[i] == -1) {
                    vert.add(vertesesModel(
                        bus_line_id: 0,
                        id: 0,
                        name: 'walking until...',
                        is_busy: false));
                    Busliness.add(ResoursBusLineModel(
                        id: 0,
                        name: 'مشياً على الأقدام',
                        price: 0,
                        city_name: 'Damascus'));
                  }
                }
                print(vert);
                showModalBottomSheet(
                    context: context,
                    builder: ((context) {
                      return Container(
                        height: MediaQuery.sizeOf(context).height / 2,
                        color: MainColor().bottonColor,
                        child: Column(
                          children: [
                            SuperRichText(
                              text: 'Shortest Path',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height / 20,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 1.3,
                              height: MediaQuery.sizeOf(context).height / 3,
                              child: ListView.separated(
                                  itemBuilder: (context, index) => Container(
                                        height:
                                            MediaQuery.sizeOf(context).height /
                                                15,
                                        decoration: ShapeDecoration(
                                          color: Color.fromARGB(
                                              224, 227, 225, 225),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: ListTile(
                                          title: Text(vert[index].name),
                                          trailing: Text(
                                            "<< " +
                                                Busliness[index].name +
                                                " >>",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 9, 104, 83)),
                                          ),
                                        ),
                                      ),
                                  separatorBuilder: (context, index) => Divider(
                                        height:
                                            MediaQuery.sizeOf(context).height /
                                                110,
                                        color: Colors.transparent,
                                      ),
                                  itemCount: vertices.length),
                            )
                          ],
                        ),
                      );
                    }));
              } else if (state is ErrorShort || state is ExcptionShort) {
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
                    FutureBuilder(
                        future: VertesesService().getVerteses(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                SearchAuto(
                                  controller: source,
                                  reg: Bus,
                                  label: 'Starting Position',
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30,
                                ),
                                Icon(
                                  Icons.arrow_downward_outlined,
                                  color: Colors.white,
                                  size: 60,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30,
                                ),
                                SearchAuto(
                                  controller: target,
                                  reg: Bus,
                                  label: 'End Position',
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                ),
                                MainContainer(
                                    context: context,
                                    containerText: 'Find Shortest Path',
                                    onTap: () async {
                                      if (source.text.isEmpty ||
                                          target.text.isEmpty) {
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
                                                element.name == source.text)
                                            .first;
                                        vertesesModel targetid = ver
                                            .where((element) =>
                                                element.name == target.text)
                                            .first;
                                        // print(sorceid.id);
                                        // print(targetid.id);
                                        // print(target.text);
                                        await BuslineService().getBuslines();
                                        context.read<ShortBloc>().add(Shortpath(
                                            path: ShortestPathModel(
                                                source_id: sorceid.id,
                                                target_id: targetid.id)));
                                      }
                                    }),
                                (state is LoadingShort)
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: MainColor().bottonColor,
                                        ),
                                      )
                                    : Container()
                              ],
                            );
                          } else {
                            return SizedBox(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: MainColor().bottonColor,
                                )));
                          }
                        }),
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
