import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Answer extends StatelessWidget {
  final String btnText;
  var ans;
  Answer(this.btnText, this.ans);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: RaisedButton(
        color: Colors.deepOrangeAccent,
        child: Text(
          btnText,
          style: GoogleFonts.getFont('Chelsea Market'),
        ),
        onPressed: ans,
      ),
    );
  }
}
