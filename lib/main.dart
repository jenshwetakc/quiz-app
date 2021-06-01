import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what did corona first identified ?',
      'answer': [
        {'text': 'On 31 December 2019', 'score': 1},
        {'text': 'On 29 December 2019', 'score': 0},
        {'text': 'On 25 December 2019', 'score': 0},
      ],
    },
    {
      'questionText': 'What are the common symptoms of COVID-19??',
      'answer': [
        {'text': 'dry cough, tiredness and fever', 'score': 1},
        {'text': 'Sudden discomfort in the chest, back or neck', 'score': 0},
        {'text': 'Sudden vision loss','score': 0},
      ],
    },
    {
      'questionText': 'The novel coronavirus is the same as COVID-19',
      'answer': [
        {'text': 'true', 'score': 10},
        {'text': 'false', 'score': 0},
        {'text': 'none of the above', 'score': 0},
      ],
    },
    {
      'questionText': 'A person who has no symptoms of COVID-19 is not a risk to others?',
      'answer': [
        {'text': 'true', 'score': 0},
        {'text': 'false', 'score': 1},
        {'text': 'none of the above', 'score': 0},
      ],
    },
    {
      'questionText': 'On March 1st, there were fewer than a dozen known COVID-19 related deaths in the US. Two months later, how many COVID-19 deaths were reported in the US?',
      'answer': [
        {'text': 'About 20,000', 'score': 0},
        {'text': 'About 60,000', 'score': 1},
        {'text': 'About 40,000', 'score': 0},
      ],
    },
    {
      'questionText': 'Where was the first known death due to COVID-19 in the nepal?',
      'answer': [
        {'text': 'May 16', 'score': 0},
        {'text': 'June 14', 'score': 1},
        {'text': 'May 14', 'score': 0},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      print('we have more question');
    } else {
      print('No more question');
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
