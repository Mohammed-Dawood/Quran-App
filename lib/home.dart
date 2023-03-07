import 'package:flutter/material.dart';
import 'package:quran_app/drawer/my_drawer.dart';
import 'package:quran_app/quran_read/home_quran_read.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MyDrawer(),
      appBar: AppBar(
        title: Text(
          "القرآن الكريم",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.png'),
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeQuranRead(),
                ),
              );
            },
            child: Text('hello'),
          ),
        ),
      ),
    );
  }
}
