import 'package:flutter/material.dart';
import 'package:quran_app/constant.dart';

class HomeQiblah extends StatelessWidget {
  const HomeQiblah({super.key});

  bool isScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "اتجاه القبلة",
          style: (isScreenWidth(context))
              ? Theme.of(context).textTheme.displaySmall
              : Theme.of(context).textTheme.displayMedium,
        ),
        leading: Icon(
          Icons.abc,
          color: const Color.fromRGBO(6, 87, 96, 1),
        ),
        actions: [
          TextButton(
            child: Icon(
              size: isScreenWidth(context) ? 25 : 28,
              Icons.arrow_forward_ios,
              color: Color.fromRGBO(254, 249, 205, 1),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Container(
        decoration: MediaQuery.of(context).orientation == Orientation.portrait
            ? (isScreenWidth(context))
                ? BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/background.png'),
                    ),
                  )
                : BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/background_portrait.png'),
                    ),
                  )
            : BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background_landscape.png'),
                ),
              ),
        child: Center(
          child: Text(
            'هذا المحتوى غير متاح حاليا',
            style: TextStyle(
              fontSize: 30,
              fontFamily: arabicFont,
              color: const Color.fromRGBO(254, 249, 205, 1),
              shadows: const [
                Shadow(
                  offset: Offset(.5, .5),
                  blurRadius: 1.0,
                  color: Color.fromRGBO(6, 87, 96, 1),
                )
              ],
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
