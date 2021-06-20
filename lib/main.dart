import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText':
          'Q1. Do you ever feel that you’ve been affected by feelings of edginess, anxiety, or nerves?',
      'answers': [
        {'text': 'Yes', 'score': -2},
        {'text': 'No', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q2. How frequently have you been doing things that mean something to you or your life?',
      'answers': [
        {'text': 'Often', 'score': 5},
        {'text': 'Rarely', 'score': -2},
        {'text': 'Neutral', 'score': 0},
      ],
    },
    {
      'questionText':
          ' Q3. Have you experienced a week or longer of lower-than-usual interest in activities that you usually enjoy? Examples might include work, exercise, or hobbies.',
      'answers': [
        {'text': 'Yes', 'score': -2},
        {'text': 'No', 'score': 10},
      ],
    },
    {
      'questionText':
          'Q4. Have you ever experienced a terrible occurrence that has impacted you significantly? Examples may include, but aren’t necessarily limited to: being the victim of armed assault; witnessing a tragedy happen to someone else, or living through a natural disaster?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q5. Do feelings of anxiety or discomfort around others bother you?',
      'answers': [
        {
          'text': 'Yes',
          'score': -2,
        },
        {'text': 'No', 'score': 10},
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

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ELEVATE-UP'),
          backgroundColor: Color(0xFF00E676),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
