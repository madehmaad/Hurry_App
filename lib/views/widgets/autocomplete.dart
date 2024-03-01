import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hurry_project/core/resources/colors.dart';

// ignore: must_be_immutable
class SearchAuto extends StatefulWidget {
  SearchAuto({
    super.key,
    required this.reg,
    required this.label,
    required this.controller,
  });
  List<String> reg;
  String label;
  TextEditingController controller;

  @override
  State<SearchAuto> createState() => _SearchAutoState();
}

class _SearchAutoState extends State<SearchAuto> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(81, 181, 178, 178)),
      width: screenWidth / 1.3,
      height: screenHeight / 15,
      child: Autocomplete<String>(
        optionsMaxHeight: screenHeight / 3,
        optionsBuilder: (TextEditingValue Searched) {
          // if user is input nothing
          if (Searched.text == '') {
            return const Iterable<String>.empty();
          }
          // if user is input something the build
          // suggestion based on the user input
          return widget.reg.where((String option) {
            return option.contains(Searched.text.toLowerCase());
          });
        },

        // when user click on the suggested
        // item this function calls
        onSelected: (
          String value,
        ) {
          setState(() {
            debugPrint('You just selected $value');
            widget.controller.text = value;

            // //  ind = reg[ind];
          });
        },
        optionsViewBuilder: (context, Function(String) onSelected, options) {
          return Align(
              alignment: Alignment.topLeft,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Material(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(4.0)),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color.fromARGB(241, 111, 111, 111),
                        border:
                            Border.all(color: Color.fromARGB(255, 83, 82, 82)),
                      ),
                      height: 45.0 * options.length,
                      width: screenWidth / 1.3, // <-- Right here !
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: options.length,
                        shrinkWrap: false,
                        itemBuilder: (BuildContext context, int index) {
                          final String option = options.elementAt(index);
                          return InkWell(
                              onTap: () => onSelected(option),
                              // child: Padding(
                              //   padding: const EdgeInsets.all(16.0),
                              //   child: Text(option),
                              // ),
                              child: Container(
                                color: Colors.transparent,
                                height: screenHeight / 20,
                                child: Center(
                                    child: Text(
                                  option,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Calibri'),
                                )),
                              ));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: Colors.grey,
                          );
                        },
                      ),
                    )),
              ));
        },
        fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
          return SizedBox(
            height: screenHeight / 15,
            width: screenWidth / 1.3,
            child: TextField(
              cursorHeight: screenHeight / 30,
              controller: controller,
              focusNode: focusNode,
              onEditingComplete: onFieldSubmitted,
              cursorColor: MainColor().bottonColor,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Calibri',
                  color: MainColor().bottonColor),
              decoration: InputDecoration(
                label: Text(
                  widget.label,
                  style: TextStyle(
                      color: const Color.fromARGB(167, 255, 255, 255)),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Icon(
                  Icons.search,
                  color: MainColor().bottonColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
          );
        },
      ),
    );
  }
}
