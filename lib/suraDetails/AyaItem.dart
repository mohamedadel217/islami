import 'package:flutter/cupertino.dart';

class AyaItem extends StatelessWidget {
  String ayaName;
  int ayaPos;

  AyaItem(this.ayaName, this.ayaPos);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Text(ayaName + '($ayaPos)',textAlign: TextAlign.center, style: TextStyle(fontSize: 24),textDirection: TextDirection.rtl,),),
    );
  }
}