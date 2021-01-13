import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question': 'What\'s your fav. color?',
      'Answer': ['Red', 'Green', 'Yellow']
    },
    {
      'question': 'What\'s your fav. programming language',
      'Answer': ['Python', 'React', 'Flutter']
    },
  ];

  var _question = 0;
  void ansQn() {
    setState(() {
      _question = _question + 1;
    });
  }

  void regen() {
    setState(() {
      _question = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.orange,
          brightness: Brightness.dark,
        ),
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.orangeAccent,
                title: Container(
                  width: double.infinity,
                  child: Text(
                    'Flutter Basics',
                    style: GoogleFonts.getFont('Chelsea Market'),
                    textAlign: TextAlign.center,
                  ),
                )),
            body: (_question < _questions.length)
                ? Container(
                    margin: EdgeInsets.only(top: 200),
                    child: Column(
                      children: [
                        Question(
                          _questions[_question]['question'],
                        ),
                        ...(_questions[_question]['Answer'] as List<String>)
                            .map((qn) {
                          return Answer(qn, ansQn);
                        }).toList()
                      ],
                    ),
                  )
                : (Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 200),
                    child: Column(children: [
                      Text(
                        'Yay you completed the Quiz!',
                        style:
                            GoogleFonts.getFont('Chelsea Market', fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      RaisedButton(
                        child: Text(
                          "Back",
                          style: GoogleFonts.getFont(
                            'Chelsea Market',
                            fontSize: 15,
                          ),
                        ),
                        onPressed: regen,
                      )
                    ]),
                  ))));
  }
}
