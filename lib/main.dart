import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: Scaffold(
       backgroundColor: Colors.grey.shade900,
       body: const SafeArea(
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 10.0),
           child: QuizPage(),
         ),
       ),
     ),
   );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];

  int questionNumber = 0;

  // List<String> questions = [
  //   'You can lead a cow downstairs but not upstairs.',
  //   'One quarter of the human bones are in the feet.',
  //   'A slug\'s blood is green'
  // ];
  //
  // List<bool> answers = [
  //   false,
  //   true,
  //   false,
  // ];

  List<Question> questionBank = [
    Question(questionText: 'You can lead a cow downstairs but not upstairs.', questionAnswer: false),
    Question(questionText: 'One quarter of the human bones are in the feet.', questionAnswer: true),
    Question(questionText: 'A slug\'s blood is green.', questionAnswer: false)
  ];

  void increaseNumber () {
    if((questionNumber + 1) == questionBank.length) {
      questionNumber = 0;
    }
    else {
      questionNumber += 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                )
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                ),
              ),
              onPressed: () {
                setState((){
                  bool correctAnswer = questionBank[questionNumber].questionAnswer;
                  if (correctAnswer == true){
                    scoreKeeper.add(
                      const Icon(Icons.check, color: Colors.green)
                    );
                  } else {
                    scoreKeeper.add(
                      const Icon(Icons.close, color: Colors.red)
                    );
                  }
                  increaseNumber();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                ),
              ),
              onPressed: (){
                setState((){
                  bool correctAnswer = questionBank[questionNumber].questionAnswer;
                  if (correctAnswer == false){
                    scoreKeeper.add(
                      const Icon(Icons.check, color: Colors.green)
                    );
                  } else {
                    scoreKeeper.add(
                      const Icon(Icons.close, color: Colors.red)
                    );
                  }
                  increaseNumber();
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ]
    );
  }
}
