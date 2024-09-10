import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn3/models/course_model.dart';
import 'package:learn3/utils/media_urls.dart';
import 'package:learn3/view/course/quiz.dart';
import 'package:learn3/view/course/quiz_landing_page.dart';
import 'package:learn3/widgets/custom_button.dart';

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
      backgroundColor: const Color(0xFFf6fafe),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf6fafe),
        leading: IconButton(
          icon: const Icon(Icons.cancel_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(value: progress)),
              ],
            ),
          ),
          SizedBox(
            height: 30,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              topic.title,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                                '${currentPage + 1} of ${widget.course.sections.length}')
                          ],
                        ),
                        const SizedBox(height: 20),
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentPage > 0)
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.4,
                    borderRadius: 4,
                    color: Color(0xFFf6fafe),
                    height: 50,
                    textColor: Color(0xff2C5680),
                    onPressed: () {
                      _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    text: "Back",
                  ),
                if (currentPage < widget.course.sections.length - 1)
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.4,
                    borderRadius: 4,
                    color: const Color(0xff2C5680),
                    height: 50,
                    onPressed: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    text: "Next",
                  ),
                if (currentPage == widget.course.sections.length - 1)
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.4,
                    borderRadius: 4,
                    color: const Color(0xff2C5680),
                    height: 50,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizLandingPage(
                            questions: widget.course.quiz,
                            course: widget.course,
                          ),
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
    );
  }
}
