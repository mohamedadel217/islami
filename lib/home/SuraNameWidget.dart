import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/suraDetails/SuraDetailsScreen.dart';

class SuraNameWidget extends StatelessWidget {
  String suraName;
  int pos;

  SuraNameWidget(this.suraName, this.pos);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSuraNameClick(context);
      },
      child: Center(
        child: Text(
          suraName,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  void onSuraNameClick(BuildContext context) {
    Navigator.of(context).pushNamed(SuraDetailsScreen.ROUTE_NAME,
        arguments: SuraDetailsScreenArgs(pos, suraName));
  }
}
