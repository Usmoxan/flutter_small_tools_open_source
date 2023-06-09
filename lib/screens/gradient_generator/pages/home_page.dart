// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types
import 'dart:async';
import 'dart:math';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gradient_maker/utils/strings.dart';
import 'package:meta_seo/meta_seo.dart';
import '../../../code_dialog.dart';
import '../widgets/color_picker_button.dart';
import '../widgets/color_picker_dialog.dart';
import '../widgets/style_selector_row.dart';
import 'direction_grid.dart';
import 'gradient_container.dart';

import 'mobile_gradient_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  //Alignments
  Alignment begin = Alignment.bottomRight;
  Alignment end = Alignment.topLeft;

  //Styles
  TextStyle widgetsTitle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  //Colors
  final Color selectedColor = const Color(0xFFDEEBFF);
  Color _color1 = Color(Random().nextInt(0xffffffff));
  Color _color2 = Color(Random().nextInt(0xffffffff));
  //Notifier

  var _colorNotifier;
  var _colorNotifier2;

  final Color _selectedColor = const Color(0xFFDEEBFF);

  final String myCode = '''
    void main() {
      print('Hello, world!');
    }
  ''';

  //Colors Grids
  Color gridItem1 = const Color(0xFFDEEBFF);
  Color gridItem2 = Colors.white;
  Color gridItem3 = Colors.white;
  Color gridItem4 = Colors.white;
  Color gridItem5 = Colors.white;
  Color gridItem6 = Colors.white;
  Color gridItem7 = Colors.white;
  Color gridItem8 = Colors.white;
  Color gridItem9 = Colors.white;

  //TextEditingController
  final firstColorEditingController = TextEditingController(text: '0');
  final secondColorEditingController = TextEditingController(text: '100');

  //INFO: Choice Function
  void funcChoice(int choice, Color selectedColor) {
    List<Color> gridColors = List.filled(9, Colors.white);
    List<Alignment> gridAlignments = [
      Alignment.bottomRight,
      Alignment.bottomCenter,
      Alignment.bottomLeft,
      Alignment.centerRight,
      Alignment.center,
      Alignment.centerLeft,
      Alignment.topRight,
      Alignment.topCenter,
      Alignment.topLeft,
    ];

    gridColors[choice - 1] = selectedColor;
    begin = gridAlignments[choice - 1];
    end = begin * -1.0;
    setState(() {
      gridItem1 = gridColors[0];
      gridItem2 = gridColors[1];
      gridItem3 = gridColors[2];
      gridItem4 = gridColors[3];
      gridItem5 = gridColors[4];
      gridItem6 = gridColors[5];
      gridItem7 = gridColors[6];
      gridItem8 = gridColors[7];
      gridItem9 = gridColors[8];
    });
  }

  //Bools
  bool isLinearStyle = true;

  @override
  void initState() {
    Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        loopTime();
      },
    );

    super.initState();
  }

  void loopTime() {
    _colorNotifier = ValueNotifier<Color>(_color1);
    _colorNotifier2 = ValueNotifier<Color>(_color2);
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // Define MetaSEO object
      MetaSEO meta = MetaSEO();
      // add meta seo data for web app as you want
      meta.author(author: 'Usmoxan');
      meta.description(
          description:
              'Flutter tools, Gradient maker,Flutter Container editor, Flutter Color shade Generator, Flutter HEX to RGBA converter. Flutter  Glassmorphism generator,Flutter  JSON to DART, Flutter  Lorem ipsum genrator The app is not fully finished Flutter little tools for you please use for free.');
      meta.keywords(
          keywords:
              'Flutter, Dart, Flutter tools, Gradient Maker Flutter, Web, tools, JSON to DART');
    }
    String linearCode = generateLinearCode(_color1, _color2, begin, end);
    String radialCode = generateRadialCode(_color1, _color2, begin);
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (mediaQueryWidth(context) > 500)
            GradientContainer(
              color1: _color1,
              color2: _color2,
              isLinearStyle: isLinearStyle,
              begin: begin,
              end: end,
            ),
          Form(
            key: _formKey,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
              ),
              width: 350,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.all(mediaQueryWidth(context) > 500 ? 50 : 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mediaQueryWidth(context) > 500
                          ? Text(
                              "Flutter\nGradient\nGenerator Pro".toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          : MobileGradientContainer(
                              isLinearStyle: isLinearStyle,
                              color1: _color1,
                              color2: _color2,
                              begin: begin,
                              end: end),
                      SizedBox(
                          height: mediaQueryWidth(context) > 500 ? 40 : 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text("Style", style: widgetsTitle),
                      ),
                      Visibility(
                          visible:
                              mediaQueryWidth(context) > 500 ? true : false,
                          child: const SizedBox(height: 10)),
                      StyleSelectorRow(
                        isLinearStyle: isLinearStyle,
                        selectedColor: _selectedColor,
                        onLinearPressed: () {
                          setState(() {
                            isLinearStyle = true;
                          });
                        },
                        onRadialPressed: () {
                          setState(() {
                            isLinearStyle = false;
                          });
                        },
                      ),
                      heightSpaceSize(),
                      Text("Direction", style: widgetsTitle),
                      heightSpaceSize(),
                      ToolsPanel(
                          funcChoice: funcChoice,
                          gridItem1: gridItem1,
                          gridItem2: gridItem2,
                          gridItem3: gridItem3,
                          gridItem4: gridItem4,
                          gridItem5: gridItem5,
                          gridItem6: gridItem6,
                          gridItem7: gridItem7,
                          gridItem8: gridItem8,
                          gridItem9: gridItem9,
                          isLinearStyle: isLinearStyle,
                          selectedColor: selectedColor),
                      heightSpaceSize(),
                      Padding(
                        padding: mediaQueryWidth(context) > 500
                            ? const EdgeInsets.only(top: 10, bottom: 10)
                            : const EdgeInsets.all(0),
                        child: Row(
                          children: [
                            Text(
                              "Colors",
                              style: widgetsTitle,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      heightSpaceSize(),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: _showDialog1,
                              child: ColorPickerButton(
                                color: _color1,
                              ),
                            ),
                          ),
                          widthSpaceSize(),
                          Expanded(
                            child: GestureDetector(
                              onTap: _showDialog2,
                              child: ColorPickerButton(
                                color: _color2,
                              ),
                            ),
                          ),
                          widthSpaceSize(),
                          OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  _color1 = Color(Random().nextInt(0xffffffff));
                                  _color2 = Color(Random().nextInt(0xffffffff));
                                });
                              },
                              child: const Text(
                                "Random",
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      ),
                      heightSpaceSize(),
                      Text("Code", style: widgetsTitle),
                      CodeViewerDialog(
                        code: isLinearStyle ? linearCode : radialCode,
                      ),
                      heightSpaceSize(),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text:
                                      isLinearStyle ? linearCode : radialCode));

                              CherryToast(
                                      icon: Icons.copy,
                                      themeColor: Colors.pink,
                                      title: const Text(""),
                                      displayTitle: false,
                                      description: const Text(copiedText),
                                      toastPosition: Position.bottom,
                                      animationDuration:
                                          const Duration(milliseconds: 1000),
                                      autoDismiss: true)
                                  .show(context);
                            },
                            child: const Text(copyText)),
                      ),
                      heightSpaceSize(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double mediaQueryWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  SizedBox heightSpaceSize() => const SizedBox(height: 10);

  SizedBox widthSpaceSize() => const SizedBox(width: 10);

  _showDialog1() {
    showDialog(
      context: context,
      builder: (context) {
        return ColorPickerDialog(
          colorNotifier: _colorNotifier,
          onColorChanged: (color) {
            setState(() {
              _color1 = color;
            });
          },
        );
      },
    );
  }

  _showDialog2() {
    showDialog(
      context: context,
      builder: (context) {
        return ColorPickerDialog(
          colorNotifier: _colorNotifier2,
          onColorChanged: (color) {
            setState(() {
              _color2 = color;
            });
          },
        );
      },
    );
  }
}
