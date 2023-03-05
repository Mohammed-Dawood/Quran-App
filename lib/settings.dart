import 'constant.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'الإعدادات',
            style: TextStyle(
              fontFamily: 'quran',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(254, 249, 205, 1),
              shadows: [
                Shadow(
                  offset: Offset(.5, .5),
                  blurRadius: 1.0,
                  color: Color.fromRGBO(6, 87, 96, 1),
                )
              ],
            ),
          ),
          backgroundColor: const Color.fromRGBO(6, 87, 96, 1),
        ),
        body: SafeArea(
          bottom: false,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/background.png'),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'حجم الخط',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(254, 249, 205, 1),
                        fontFamily: 'quran',
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(.5, .5),
                            blurRadius: 1.0,
                            color: Color.fromRGBO(6, 87, 96, 1),
                          )
                        ],
                      ),
                    ),
                    Slider(
                      activeColor: const Color.fromRGBO(254, 249, 205, 1),
                      value: arabicFontSize,
                      min: 20,
                      max: 40,
                      onChanged: (value) {
                        setState(() {
                          arabicFontSize = value;
                        });
                        saveSettings();
                      },
                    ),
                    // Text(
                    //   "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                    //   style: TextStyle(
                    //       fontFamily: 'quran', fontSize: arabicFontSize),
                    //   textDirection: TextDirection.rtl,
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 10, bottom: 10),
                    //   child: Divider(),
                    // ),
                    // const Text(
                    //   'Mushaf Mode Font Size:',
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 15,
                    //   ),
                    // ),
                    // Slider(
                    //   value: mushafFontSize,
                    //   min: 20,
                    //   max: 50,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       mushafFontSize = value;
                    //     });
                    //   },
                    // ),
                    // Text(
                    //   "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                    //   style: TextStyle(
                    //       fontFamily: 'quran', fontSize: mushafFontSize),
                    //   textDirection: TextDirection.rtl,
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                arabicFontSize = 28;
                                mushafFontSize = 40;
                              });
                              saveSettings();
                            },
                            child: const Text('Reset')),
                        ElevatedButton(
                            onPressed: () {
                              saveSettings();
                              Navigator.of(context).pop();
                            },
                            child: const Text('Save')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
