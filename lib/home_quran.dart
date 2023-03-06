import 'constant.dart';
import 'my_drawer.dart';
import 'surah_builder.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/arabic_sura_number.dart';

class HomeQuran extends StatefulWidget {
  const HomeQuran({Key? key}) : super(key: key);

  @override
  State<HomeQuran> createState() => _HomeQuranState();
}

class _HomeQuranState extends State<HomeQuran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MyDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Go to bookmark',
        onPressed: () async {
          fabIsClicked = true;
          if (await readBookmark() == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SurahBuilder(
                  arabic: quran[0],
                  sura: bookmarkedSura - 1,
                  suraName: arabicName[bookmarkedSura - 1]['name'],
                  ayah: bookmarkedAyah,
                ),
              ),
            );
          }
        },
        foregroundColor: const Color.fromRGBO(254, 249, 205, 1),
        backgroundColor: const Color.fromRGBO(6, 87, 96, 1),
        child: const Icon(Icons.bookmark),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "القرآن الكريم",
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
      body: FutureBuilder(
        future: readJson(),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return indexCreator(snapshot.data, context);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  Container indexCreator(quran, context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/background.png'),
        ),
      ),
      child: ListView(
        children: [
          for (int i = 0; i < 114; i++)
            TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      arabicName[i]['name'],
                      style: const TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(254, 249, 205, 1),
                        fontFamily: 'quran',
                        shadows: [
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
                  const SizedBox(
                    width: 10,
                  ),
                  ArabicSuraNumber(i: i),
                ],
              ),
              onPressed: () {
                fabIsClicked = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SurahBuilder(
                      arabic: quran[0],
                      sura: i,
                      suraName: arabicName[i]['name'],
                      ayah: 0,
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
