import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = '';
    if (resultScore >= 41) {
      resultText = resultText + 'You are awesome!';

      print(resultScore);
    }
    if (resultScore >= 31) {
      resultText = resultText + 'Pretty likeable!';

      print(resultScore);
    }
    if (resultScore >= 21) {
      resultText = resultText + 'You need to work more!';
    }
    if (resultScore >= 1) {
      resultText = resultText + 'You need to work hard!';
    } else {
      resultText = resultText + 'This is a poor score!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (resultScore >= 1)
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ), //Text
          Text(
            'Score ' '$resultScore',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          TextButton(
            child: Text(
              'Restart Quiz!',
            ), //Text

            // color: Colors.blue,
            onPressed: () => resetHandler(),
          ), //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
