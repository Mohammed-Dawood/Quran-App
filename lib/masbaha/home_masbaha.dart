import 'package:flutter/material.dart';
import 'package:quran_app/constant.dart';
import 'package:get_storage/get_storage.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

class HomeMasbaha extends StatefulWidget {
  const HomeMasbaha({super.key});

  @override
  State<HomeMasbaha> createState() => _HomeMasbahaState();
}

class _HomeMasbahaState extends State<HomeMasbaha> {
  final box = GetStorage();
  int get masbahaNumber => box.read('newMasbahaNumber') ?? 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          "المسبحة الالكترونية",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        leading: Icon(
          Icons.abc,
          color: const Color.fromRGBO(6, 87, 96, 1),
        ),
        actions: [
          TextButton(
            child: const Icon(
              size: 25,
              Icons.arrow_forward_ios,
              color: Color.fromRGBO(254, 249, 205, 1),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      bottomNavigationBar: FloatingNavbar(
        currentIndex: 2,
        borderRadius: 5,
        itemBorderRadius: 5,
        fontSize: fontSize1,
        iconSize: fontSize1 + 5,
        backgroundColor: const Color.fromRGBO(6, 87, 96, 1),
        selectedItemColor: const Color.fromRGBO(6, 87, 96, 1),
        unselectedItemColor: const Color.fromRGBO(254, 249, 205, 1),
        selectedBackgroundColor: const Color.fromRGBO(254, 249, 205, 1),
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 10,
        ),
        items: [
          FloatingNavbarItem(
            icon: Icons.remove,
            title: "مسح",
          ),
          FloatingNavbarItem(
            icon: Icons.restore,
            title: "تصفير",
          ),
          FloatingNavbarItem(
            icon: Icons.add,
            title: "تسبيح",
          ),
        ],
        onTap: (int screenNumber) async {
          if (screenNumber == 0) {
            masbahaNumber == 0
                ? setState(() {
                    box.write('newMasbahaNumber', 0);
                  })
                : setState(() {
                    box.write('newMasbahaNumber', masbahaNumber - 1);
                  });
          }
          if (screenNumber == 1) {
            setState(() {
              box.write('newMasbahaNumber', 0);
            });
          }
          if (screenNumber == 2) {
            masbahaNumber == 999
                ? setState(() {
                    box.write('newMasbahaNumber', 0);
                  })
                : setState(() {
                    box.write('newMasbahaNumber', masbahaNumber + 1);
                  });
          }
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.png'),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$masbahaNumber',
                style: TextStyle(
                  fontSize: fontSize1 + 50,
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
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
