import 'constant.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SurahBuilder extends StatefulWidget {
  final sura;
  final arabic;
  final suraName;
  int ayah;

  SurahBuilder(
      {Key? key, this.sura, this.arabic, this.suraName, required this.ayah})
      : super(key: key);

  @override
  _SurahBuilderState createState() => _SurahBuilderState();
}

class _SurahBuilderState extends State<SurahBuilder> {
  bool view = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => jumbToAyah());
    super.initState();
  }

  jumbToAyah() {
    if (fabIsClicked) {
      itemScrollController.scrollTo(
          index: widget.ayah,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic);
    }
    fabIsClicked = false;
  }

  Row verseBuilder(int index, previousVerses) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.arabic[index + previousVerses]['aya_text'],
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: fontSize2,
              fontFamily: arabicFont,
              color: Color.fromARGB(255, 254, 229, 205),
              shadows: const [
                Shadow(
                  offset: Offset(.5, .5),
                  blurRadius: 1.0,
                  color: Color.fromRGBO(6, 87, 96, 1),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  SafeArea SingleSuraBuilder(LengthOfSura) {
    String fullSura = '';
    int previousVerses = 0;
    if (widget.sura + 1 != 1) {
      for (int i = widget.sura - 1; i >= 0; i--) {
        previousVerses = previousVerses + noOfVerses[i];
      }
    }

    if (!view)
      for (int i = 0; i < LengthOfSura; i++) {
        fullSura += (widget.arabic[i + previousVerses]['aya_text']);
      }

    return SafeArea(
      bottom: false,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.png'),
          ),
        ),
        child: view
            ? ScrollablePositionedList.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      (index != 0) || (widget.sura == 0) || (widget.sura == 8)
                          ? const Text('')
                          : const RetunBasmala(),
                      PopupMenuButton(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 15,
                            right: 15,
                          ),
                          child: verseBuilder(index, previousVerses),
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            onTap: () {
                              saveBookMark(widget.sura + 1, index);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "إشارة مرجعية",
                                  style: TextStyle(
                                    color: Color.fromRGBO(6, 87, 96, 1),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.bookmark_add,
                                  color: Color.fromRGBO(6, 87, 96, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: LengthOfSura,
              )
            : ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.sura + 1 != 1 && widget.sura + 1 != 9
                                ? const RetunBasmala()
                                : const Text(''),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 15,
                                right: 15,
                              ),
                              child: Text(
                                fullSura, //mushaf mode
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int LengthOfSura = noOfVerses[widget.sura];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              child: const Icon(
                size: 30,
                Icons.arrow_forward_ios,
                color: Color.fromRGBO(254, 249, 205, 1),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          leading: Tooltip(
            message: 'Mushaf Mode',
            child: TextButton(
              child: const Icon(
                size: 30,
                Icons.chrome_reader_mode,
                color: Color.fromRGBO(254, 249, 205, 1),
              ),
              onPressed: () {
                setState(
                  () {
                    view = !view;
                  },
                );
              },
            ),
          ),
          title: Text(
            widget.suraName,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        body: SingleSuraBuilder(LengthOfSura),
      ),
    );
  }
}

class RetunBasmala extends StatelessWidget {
  const RetunBasmala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'بسم الله الرحمن الرحيم',
      style: TextStyle(
        fontFamily: 'quran',
        fontSize: fontSize2,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(254, 249, 205, 1),
        shadows: [
          Shadow(
            offset: Offset(.5, .5),
            blurRadius: 1.0,
            color: Color.fromRGBO(4, 92, 100, 1),
          )
        ],
      ),
      textDirection: TextDirection.rtl,
    );
  }
}
