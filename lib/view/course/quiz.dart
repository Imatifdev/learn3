// import 'package:flutter/material.dart';
// import 'package:learn3/models/course_model.dart';
// import 'package:learn3/view/NavPages/explore.dart';
// import 'package:learn3/widgets/custom_button.dart';

// class QuizPage extends StatefulWidget {
//   final List<Question> questions;

//   QuizPage({required this.questions});

//   @override
//   _QuizPageState createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {
//   int currentQuestionIndex = 0;
//   int score = 0;
//   Map<int, int> selectedAnswers = {};

//   @override
//   Widget build(BuildContext context) {
//     double progress = (currentQuestionIndex + 1) / widget.questions.length;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Icon(Icons.cancel_outlined),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(0.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: SizedBox(
//                   width: 200, child: LinearProgressIndicator(value: progress)),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             Expanded(
//               child: Container(
//                 width: double
//                     .infinity, // Ensure the container takes up available width
//                 decoration: BoxDecoration(
//                   color: Color(0xFFf6fafe),
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20)),
//                   border: Border(
//                     top: BorderSide(color: Color(0xff2C5680), width: 2.0),
//                     left: BorderSide(color: Color(0xff2C5680), width: 2.0),
//                     right: BorderSide(color: Color(0xff2C5680), width: 2.0),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Quiz",
//                             style: TextStyle(
//                                 color: Color(
//                                   0xff545F71,
//                                 ),
//                                 fontSize: 18),
//                           ),
//                           Text(
//                               "${currentQuestionIndex + 1} / ${widget.questions.length}",
//                               style: TextStyle(fontSize: 20)),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                       child: Text(
//                         widget.questions[currentQuestionIndex].questionText,
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: widget
//                             .questions[currentQuestionIndex].options.length,
//                         itemBuilder: (context, index) {
//                           return RadioListTile<int>(
//                             title: Text(widget.questions[currentQuestionIndex]
//                                 .options[index]),
//                             value: index,

//                             selectedTileColor: Colors.red,
//                             groupValue: selectedAnswers[currentQuestionIndex],

//                             // Active radio button color
//                             selected:
//                                 selectedAnswers[currentQuestionIndex] == index,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedAnswers[currentQuestionIndex] = value!;
//                                 // Check if the selected answer is correct
//                                 if (widget.questions[currentQuestionIndex]
//                                         .correctAnswerIndex ==
//                                     value) {
//                                   score++;
//                                 }
//                               });
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   if (currentQuestionIndex > 0)
//                     CustomButton(
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       borderRadius: 4,
//                       color: Color(0xFFf6fafe),
//                       height: 50,
//                       textColor: Color(0xff2C5680),
//                       onPressed: () {
//                         setState(() {
//                           currentQuestionIndex--;
//                         });
//                       },
//                       text: "Previous",
//                     ),
//                   CustomButton(
//                     width: MediaQuery.of(context).size.width * 0.4,
//                     borderRadius: 4,
//                     color: const Color(0xff2C5680),
//                     height: 50,
//                     onPressed: () {
//                       if (currentQuestionIndex < widget.questions.length - 1) {
//                         setState(() {
//                           currentQuestionIndex++;
//                         });
//                       } else {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => QuizResultPage(
//                                 score: score,
//                                 totalQuestions: widget.questions.length),
//                           ),
//                         );
//                       }
//                     },
//                     text: currentQuestionIndex == widget.questions.length - 1
//                         ? "Finish"
//                         : "Next",
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Quiz Result Page
// class QuizResultPage extends StatelessWidget {
//   final int score;
//   final int totalQuestions;

//   QuizResultPage({required this.score, required this.totalQuestions});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Quiz Results"),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Quiz Completed!",
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 24),
//               Text(
//                 "You scored $score out of $totalQuestions",
//                 style: TextStyle(fontSize: 20),
//               ),
//               SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (ctx) => Explore()));
//                 },
//                 child: Text("Go Back to Courses"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:learn3/models/course_model.dart';
import 'package:learn3/utils/const_values.dart';
import 'package:learn3/view/NavPages/explore.dart';
import 'package:learn3/widgets/custom_button.dart';

class QuizPage extends StatefulWidget {
  final List<Question> questions;

  QuizPage({required this.questions});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  Map<int, int> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    double progress = (currentQuestionIndex + 1) / widget.questions.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.cancel_outlined),
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
                  width: 200, child: LinearProgressIndicator(value: progress)),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                width: double
                    .infinity, // Ensure the container takes up available width
                decoration: BoxDecoration(
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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quiz",
                            style: TextStyle(
                                color: Color(0xff545F71), fontSize: 18),
                          ),
                          Text(
                              "${currentQuestionIndex + 1} / ${widget.questions.length}",
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        widget.questions[currentQuestionIndex].questionText,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget
                            .questions[currentQuestionIndex].options.length,
                        itemBuilder: (context, index) {
                          return RadioListTile<int>(
                            title: Text(widget.questions[currentQuestionIndex]
                                .options[index]),
                            value: index,
                            selectedTileColor: Colors.red,
                            groupValue: selectedAnswers[currentQuestionIndex],
                            selected:
                                selectedAnswers[currentQuestionIndex] == index,
                            onChanged: (value) {
                              setState(() {
                                selectedAnswers[currentQuestionIndex] = value!;
                                // Check if the selected answer is correct
                                if (widget.questions[currentQuestionIndex]
                                        .correctAnswerIndex ==
                                    value) {
                                  score++;
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentQuestionIndex > 0)
                    CustomButton(
                      width: MediaQuery.of(context).size.width * 0.4,
                      borderRadius: 4,
                      color: Color(0xFFf6fafe),
                      height: 50,
                      textColor: Color(0xff2C5680),
                      onPressed: () {
                        setState(() {
                          currentQuestionIndex--;
                        });
                      },
                      text: "Previous",
                    ),
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.4,
                    borderRadius: 4,
                    color: const Color(0xff2C5680),
                    height: 50,
                    onPressed: () {
                      if (currentQuestionIndex < widget.questions.length - 1) {
                        setState(() {
                          currentQuestionIndex++;
                        });
                      } else {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return QuizResultBottomSheet(
                              score: score,
                              totalQuestions: widget.questions.length,
                            );
                          },
                        );
                      }
                    },
                    text: currentQuestionIndex == widget.questions.length - 1
                        ? "Finish"
                        : "Next",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizResultBottomSheet extends StatelessWidget {
  final int score;
  final int totalQuestions;

  QuizResultBottomSheet({required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
          ),
          if (score > 3 || score == 3)
            Icon(
              Icons.check_circle,
              size: 50,
              color: Colors.green,
            ),
          if (score < 3)
            Icon(
              Icons.replay,
              size: 50,
              color: Colors.red,
            ),

          SizedBox(
            height: 30,
          ),
          Text(
            score > 3 || score == 3
                ? "You got all answers correct congratulations"
                : "Please try again",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          Text(
            "Claim your reward ",
            style: TextStyle(fontSize: 18),
          ),

          // Text(
          //   "You scored $score out of $totalQuestions",
          //   style: TextStyle(fontSize: 20),
          // ),
          SizedBox(height: 24),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xff2C5680)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => Explore()));
              },
              borderRadius: BorderRadius.circular(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("You have earned 2000 Points",
                            style: AppConstants.bodyText(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("You have earned 2000 Points",
                            style: AppConstants.bodyText(
                              fontSize: 16,
                              color: Color(0xff2C5680),
                              fontWeight: FontWeight.normal,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
