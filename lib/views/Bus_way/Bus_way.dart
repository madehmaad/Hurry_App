import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hurry_project/core/domain/service/Get/get_verteses.dart';
import 'package:hurry_project/core/resources/colors.dart';
import 'package:hurry_project/views/widgets/autocomplete.dart';
import 'package:super_rich_text/super_rich_text.dart';

class BusWayScreen extends StatelessWidget {
  const BusWayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
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
                          reg: Bus,
                          label: 'Starting Position',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        Icon(
                          Icons.arrow_downward_outlined,
                          color: Colors.white,
                          size: 60,
                        ),
                        SearchAuto(reg: Bus, label: 'End Position')
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}
