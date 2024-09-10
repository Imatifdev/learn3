import 'package:flutter/material.dart';
import 'package:learn3/models/course_model.dart';
import 'package:learn3/view/NavPages/explore.dart';
import 'package:learn3/view/course/quiz.dart';
import 'package:learn3/widgets/custom_button.dart';

class QuizLandingPage extends StatefulWidget {
  final Course course;

  const QuizLandingPage(
      {super.key, required this.course, required List<Question> questions});
  @override
  _QuizLandingPageState createState() => _QuizLandingPageState();
}

class _QuizLandingPageState extends State<QuizLandingPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  Map<int, int> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.cancel_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                  width: 200, child: LinearProgressIndicator(value: 1 / 5)),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                width: double
                    .infinity, // Ensure the container takes up available width
                decoration: const BoxDecoration(
                  color: Color(0xFFf6fafe),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border(
                    top: BorderSide(color: Color(0xff2C5680), width: 2.0),
                    left: BorderSide(color: Color(0xff2C5680), width: 2.0),
                    right: BorderSide(color: Color(0xff2C5680), width: 2.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quiz",
                            style: TextStyle(
                                color: Color(
                                  0xff545F71,
                                ),
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Read to Test Your Knowledge",
                            style: TextStyle(
                                color: Color(
                                  0xff545F71,
                                ),
                                fontWeight: FontWeight.bold,
                                fontSize: 42),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Finish quiz and earn token",
                            style: TextStyle(
                                color: Color(
                                  0xff545F71,
                                ),
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/landing_quiz.png',
                        fit: BoxFit.contain,
                        height: 300,
                        width: double.infinity,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            width: MediaQuery.of(context).size.width * 0.4,
                            borderRadius: 4,
                            color: Color(0xFFf6fafe),
                            height: 50,
                            textColor: Color(0xff2C5680),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            text: "Back",
                          ),
                          CustomButton(
                            width: MediaQuery.of(context).size.width * 0.4,
                            borderRadius: 4,
                            color: const Color(0xff2C5680),
                            height: 50,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      QuizPage(questions: widget.course.quiz),
                                ),
                              );
                            },
                            text: "Start Quiz",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
