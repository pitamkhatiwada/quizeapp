import 'package:flutter/material.dart';
import 'quize_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(const MaterialApp(
    home: Quizer(),
  ),
  );
}
class Quizer extends StatelessWidget {
  const Quizer({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body:SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Quizpage(),
          ),

        ),
      ),
    );
  }
}
class Quizpage extends StatefulWidget {
  const Quizpage({Key? key}) : super(key: key);

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Icon> spp = [];
void checkAnswer(bool userPickedAnswer){
  bool cans =  quizBrain.getCorrectAnswer();
  setState(() {
    if (quizBrain.isFinished() == true) {

    Alert(
      context: context,
      title: 'Finished!',
      desc: 'You\'ve reached the end of the quiz.',
    ).show();

    quizBrain.reset();


    spp = [];
  }


  if(userPickedAnswer== cans){
    spp.add(Icon(Icons.check,color: Colors.green,));
  }
  else{
    spp.add(Icon(Icons.close,color: Colors.red,));
  }

    quizBrain.nextQuestion();
  });


}
int qn = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style:TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text('true',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: (){
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: MaterialButton(
              textColor: Colors.red,
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: (){
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
            children: spp


        ),
      ],
    );
  }
}
/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
