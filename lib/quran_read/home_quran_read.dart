import 'surah_builder.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/constant.dart';
import 'package:quran_app/quran_read/arabic_sura_number.dart';

class HomeQuranRead extends StatefulWidget {
  const HomeQuranRead({Key? key}) : super(key: key);

  @override
  State<HomeQuranRead> createState() => _HomeQuranReadState();
}

class _HomeQuranReadState extends State<HomeQuranRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: 'انتقل إلى المرجعية',
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
        child: const Icon(Icons.bookmark),
      ),
      appBar: AppBar(
        title: Text(
          "القرآن الكريم",
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
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 10,
                      ),
                      child: Text(
                        arabicName[i]['name'],
                        style: TextStyle(
                          fontSize: fontSize2,
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
                    const SizedBox(
                      width: 10,
                    ),
                    ArabicSuraNumber(i: i),
                  ],
                ),
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
