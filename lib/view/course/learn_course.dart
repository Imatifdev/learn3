import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn3/models/course_model.dart';
import 'package:learn3/view/course/quiz.dart';

class LearningPage extends StatefulWidget {
  final Course course;

  LearningPage({required this.course});

  @override
  _LearningPageState createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  int currentPage = 0;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    double progress = (currentPage + 1) / widget.course.sections.length;

    return Scaffold(
      appBar: AppBar(
        title: Text("Learning: ${widget.course.title}"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                    "Topic ${currentPage + 1} of ${widget.course.sections.length}",
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                LinearProgressIndicator(value: progress),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.course.sections.length,
              itemBuilder: (context, index) {
                final topic = widget.course.sections[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        topic.title,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(topic.readingMaterial),
                    ],
                  ),
                );
              },
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (currentPage > 0)
                TextButton(
                  onPressed: () {
                    _controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  },
                  child: Text("Previous"),
                ),
              if (currentPage < widget.course.sections.length - 1)
                TextButton(
                  onPressed: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  },
                  child: Text("Next"),
                ),
              if (currentPage == widget.course.sections.length - 1)
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            QuizPage(questions: widget.course.quiz),
                      ),
                    );
                  },
                  child: Text("Start Quiz"),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
