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
  bool isScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: isScreenWidth(context) ? 300 : 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(6, 87, 96, 1),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/logo_drawer.png'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${fontSize1.toInt()} ',
                      style: TextStyle(
                        fontSize: isScreenWidth(context) ? 20 : 22,
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
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                        child: Text(
                          'حجم خط المسبحة',
                          style: TextStyle(
                            fontSize: isScreenWidth(context) ? 20 : 22,
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
                      ),
                    ),
                  ],
                ),
              ),
              Slider(
                activeColor: const Color.fromRGBO(6, 87, 96, 1),
                value: fontSize1,
                min: 20,
                max: 40,
                onChanged: (value) {
                  setState(
                    () {
                      fontSize1 = value;
                    },
                  );
                  saveSettings();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Divider(
                  thickness: 1,
                  color: const Color.fromRGBO(6, 87, 96, 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${fontSize2.toInt()} ',
                      style: TextStyle(
                        fontSize: isScreenWidth(context) ? 20 : 22,
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
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                        child: Text(
                          'حجم خط القرآن',
                          style: TextStyle(
                            fontSize: isScreenWidth(context) ? 20 : 22,
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
                      ),
                    ),
                  ],
                ),
              ),
              Slider(
                activeColor: const Color.fromRGBO(6, 87, 96, 1),
                value: fontSize2,
                min: 20,
                max: 40,
                onChanged: (value) {
                  setState(
                    () {
                      fontSize2 = value;
                    },
                  );
                  saveSettings();
                },
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Divider(
                  thickness: 1,
                  color: const Color.fromRGBO(6, 87, 96, 1),
                ),
              ),
              Text(
                'الاصدار 1.0.0',
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
              SizedBox(
                height: 30,
              )
            ],
          ),
        ],
      ),
    );
  }
}
