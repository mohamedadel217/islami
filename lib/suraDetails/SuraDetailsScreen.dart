import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/suraDetails/AyaItem.dart';

import '../home/main.dart';

class SuraDetailsScreen extends StatefulWidget {
  static final String ROUTE_NAME = 'suraDetailsScreen';

  @override
  _SuraDetailsScreenState createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayaList = [];

  @override
  Widget build(BuildContext context) {
    var args =
    ModalRoute
        .of(context)
        .settings
        .arguments as SuraDetailsScreenArgs;
    readSuraContent('assets/content/${args.filePos}.txt');
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg3.png'), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Theme
              .of(context)
              .accentColor),
          backgroundColor: Colors.transparent,
          title: Text(
            'islami',
            style: TextStyle(color: MyThemeData.SECONDARY_COLOR),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body:getMainView(),
      ),
    );
  }

  Widget getMainView() {
    return Container(
      child: Center(
        child: ayaList.length == 0
            ? CircularProgressIndicator()
            : Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(204, 254, 254, 254),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.only(top: 50),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return AyaItem(ayaList[index], index + 1);
              },
              itemCount: ayaList.length,
              separatorBuilder: (context, index) {
                return Container(
                  height: 1,
                  color: Theme
                      .of(context)
                      .primaryColor,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                );
              }),
        ),
      ),
    );
  }

  void readSuraContent(String fileName) async {
    String fileContent = await rootBundle.loadString(fileName);
    List<String> lines = fileContent.split('\n');
    setState(() {
      ayaList = lines;
    });
  }
}

class SuraDetailsScreenArgs {
  int filePos;
  String suraName;

  SuraDetailsScreenArgs(this.filePos, this.suraName);
}
