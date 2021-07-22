import 'package:flutter/material.dart';
import 'package:islami/home/AhadeathFragment.dart';
import 'package:islami/home/QuranFragment.dart';
import 'package:islami/home/RadioFragment.dart';
import 'package:islami/home/SebhaFragment.dart';
import 'package:islami/suraDetails/SuraDetailsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {SuraDetailsScreen.ROUTE_NAME: (context) => SuraDetailsScreen()
      },
      theme: ThemeData(
        primaryColor: MyThemeData.PRIMARY_COLOR,
        accentColor: MyThemeData.SECONDARY_COLOR,
      ),
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg3.png'), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'islami',
              style: TextStyle(color: MyThemeData.SECONDARY_COLOR),
            ),
            elevation: 0,
            centerTitle: true,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: MyThemeData.PRIMARY_COLOR),
            child: BottomNavigationBar(
              selectedFontSize: 20,
              selectedItemColor: MyThemeData.SECONDARY_COLOR,
              unselectedItemColor: Colors.white,
              currentIndex: selectedIndex,
              onTap: (clickableIconIndex) {
                onBottomNavigationButtonClick(clickableIconIndex);
              },
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/radio_blue.png')),
                    label: 'radio'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/sebha_blue.png')),
                    label: 'tasbeh'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/ahadeath.png')),
                    label: 'ahadeath'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/quran.png')),
                    label: 'quran'),
              ],
            ),
          ),
          body: getMainViewWidget(),
        ),
      ),
    );
  }

  Widget getMainViewWidget() {
    if (selectedIndex == 0) {
      return RadioFragment();
    } else if (selectedIndex == 1) {
      return SebhaFragment();
    } else if (selectedIndex == 2) {
      return AhadeathFragment();
    } else {
      return QuranFragment();
    }
  }

  onBottomNavigationButtonClick(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

class MyThemeData {
  static final PRIMARY_COLOR = Color.fromARGB(255, 183, 147, 95);
  static final SECONDARY_COLOR = Color.fromARGB(255, 36, 36, 36);
}
