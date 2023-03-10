import 'package:flutter/material.dart';
import 'package:quran_app/salat/home_salat.dart';
import 'package:quran_app/drawer/my_drawer.dart';
import 'package:quran_app/qiblah/home_qiblah.dart';
import 'package:quran_app/masbaha/home_masbaha.dart';
import 'package:quran_app/quran_read/home_quran_read.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  bool isScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      endDrawer: const MyDrawer(),
      appBar: AppBar(
        title: Text(
          "الصفحة الرئيسية",
          style: isScreenWidth(context)
              ? Theme.of(context).textTheme.displaySmall
              : Theme.of(context).textTheme.displayMedium,
        ),
        iconTheme: IconThemeData(
          color: const Color.fromRGBO(254, 249, 205, 1),
          size: isScreenWidth(context) ? 25 : 28,
        ),
      ),
      bottomNavigationBar: FloatingNavbar(
        currentIndex: 2,
        borderRadius: 5,
        itemBorderRadius: 5,
        fontSize: 20,
        iconSize: 25,
        backgroundColor: const Color.fromRGBO(6, 87, 96, 1),
        selectedItemColor: const Color.fromRGBO(254, 249, 205, 1),
        unselectedItemColor: const Color.fromRGBO(254, 249, 205, 1),
        selectedBackgroundColor: const Color.fromRGBO(6, 87, 96, 1),
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
            icon: Icons.watch_later,
            title: "الصلاة",
          ),
          FloatingNavbarItem(
            icon: Icons.explore,
            title: "القبلة",
          ),
          FloatingNavbarItem(
            icon: Icons.exposure,
            title: "المسبحة",
          ),
          FloatingNavbarItem(
            icon: Icons.menu_book,
            title: "القرآن",
          ),
        ],
        onTap: (int screenNumber) async {
          if (screenNumber == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeSalat(),
              ),
            );
          }
          if (screenNumber == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeQiblah(),
              ),
            );
          }
          if (screenNumber == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeMasbaha(),
              ),
            );
          }
          if (screenNumber == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeQuranRead(),
              ),
            );
          }
        },
      ),
      body: Container(
        decoration: MediaQuery.of(context).orientation == Orientation.portrait
            ? isScreenWidth(context)
                ? BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/screen.png'),
                    ),
                  )
                : BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/screen_portrait.png'),
                    ),
                  )
            : BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/screen_landscape.png'),
                ),
              ),
      ),
    );
  }
}
