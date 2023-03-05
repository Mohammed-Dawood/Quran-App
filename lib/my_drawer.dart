import 'package:flutter/material.dart';
import 'package:quran_app/constant.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(254, 249, 205, 1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(6, 87, 96, 1),
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/icon.png'),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Icon(
                    Icons.format_size_outlined,
                    size: 25,
                    color: Color.fromRGBO(6, 87, 96, 1),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'حجم الخط',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(6, 87, 96, 1),
                      fontFamily: 'quran',
                      shadows: [
                        Shadow(
                          offset: Offset(.5, .5),
                          blurRadius: 1.0,
                          color: Color.fromRGBO(6, 87, 96, 1),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Directionality(
          //   textDirection: TextDirection.rtl,
          //   child: ListTile(
          //     leading: const Icon(
          //       Icons.format_size_outlined,
          //       size: 25,
          //       color: Color.fromRGBO(6, 87, 96, 1),
          //     ),
          //     title: const Text(
          //       'حجم الخط',
          //       style: TextStyle(
          //         fontSize: 20,
          //         color: Color.fromRGBO(6, 87, 96, 1),
          //         fontFamily: 'quran',
          //         shadows: [
          //           Shadow(
          //             offset: Offset(.5, .5),
          //             blurRadius: 1.0,
          //             color: Color.fromRGBO(6, 87, 96, 1),
          //           )
          //         ],
          //       ),
          //     ),
          //     onTap: () {
          //       Navigator.pop(context);
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => const Settings()));
          //     },
          //   ),
          // ),
          Slider(
            activeColor: const Color.fromRGBO(6, 87, 96, 1),
            value: arabicFontSize,
            min: 20,
            max: 40,
            onChanged: (value) {
              setState(
                () {
                  arabicFontSize = value;
                },
              );
              saveSettings();
            },
          ),
        ],
      ),
    );
  }
}
