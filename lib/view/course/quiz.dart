import 'package:flutter/material.dart';
import 'package:learn3/models/course_model.dart';

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
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Indicator
            LinearProgressIndicator(value: progress),
            SizedBox(height: 16),
            Text(
                "Question ${currentQuestionIndex + 1} of ${widget.questions.length}",
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text(
              widget.questions[currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Options
            Expanded(
              child: ListView.builder(
                itemCount:
                    widget.questions[currentQuestionIndex].options.length,
                itemBuilder: (context, index) {
                  return RadioListTile<int>(
                    title: Text(
                        widget.questions[currentQuestionIndex].options[index]),
                    value: index,
                    selectedTileColor: Colors.red,
                    groupValue: selectedAnswers[currentQuestionIndex],
                    activeColor: Colors.green,
                    selected: selectedAnswers[currentQuestionIndex] == index,
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
            // Next or Finish Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentQuestionIndex > 0)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currentQuestionIndex--;
                      });
                    },
                    child: Text("Previous"),
                  ),
                TextButton(
                  onPressed: () {
                    if (currentQuestionIndex < widget.questions.length - 1) {
                      setState(() {
                        currentQuestionIndex++;
                      });
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizResultPage(
                              score: score,
                              totalQuestions: widget.questions.length),
                        ),
                      );
                    }
                  },
                  child: Text(
                      currentQuestionIndex == widget.questions.length - 1
                          ? "Finish"
                          : "Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Quiz Result Page
class QuizResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  QuizResultPage({required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Results"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quiz Completed!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Text(
                "You scored $score out of $totalQuestions",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Go Back to Courses"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
