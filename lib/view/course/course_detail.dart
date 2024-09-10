import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:learn3/models/course_model.dart';
import 'package:learn3/utils/const_values.dart';
import 'package:learn3/utils/media_urls.dart';
import 'package:learn3/view/course/learn_course.dart';
import 'package:learn3/widgets/custom_button.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;

  CourseDetailPage({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf6fafe),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf6fafe),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff2C5680)),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled:
                    true, // Allow the bottom sheet to take more space
                builder: (context) {
                  return Container(
                    color: Color(0xFFf6fafe),

                    padding: EdgeInsets.all(16),
                    height: MediaQuery.of(context).size.height *
                        0.69, // Set height to 80% of screen height
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Start Your Learning Journey Today',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Divider(
                                height: 30,
                                thickness: 5,
                                color: const Color(0xff2C5680),
                              ),
                            ),
                            SizedBox(height: 50),
                            Center(
                              child: Image.asset(
                                'assets/images/quizHome.png',
                                fit: BoxFit.contain,
                                height: 200,
                                width: 340,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              'This quest is provided to you by Learn.3. At the end, you would take a short Quiz.',
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  borderRadius: 4,
                                  color: const Color(0xff2C5680),
                                  height: 50,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LearningPage(course: course),
                                      ),
                                    );
                                  },
                                  text: "Start",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            borderRadius: BorderRadius.circular(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Start Learning",
                          style: AppConstants.bodyText(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          )),
                      Text("Earn Points ${course.points} when completed",
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    course.duration,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBar.readOnly(
                        isHalfAllowed: true,
                        alignment: Alignment.center,
                        filledIcon: Icons.star,
                        size: 15,
                        emptyIcon: Icons.star_border,
                        emptyColor: Colors.redAccent,
                        filledColor: Colors.grey,
                        halfFilledColor: Colors.grey,
                        halfFilledIcon: Icons.star_half,
                        initialRating: course.ratings,
                        maxRating: 5,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        course.ratings.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '(${course.enrollments.toString()})',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              // Course Description
              SizedBox(
                height: 20,
              ),

              Text(
                "About Course:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              Text(
                course.about,
                style: TextStyle(fontSize: 16),
              ),

              // Course Title
              SizedBox(height: 8),
              // Course Title
              SizedBox(height: 8),
              // Course Thumbnail
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(width: 6, color: Color(0xff2C5680)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(course.thumbnail))),
              ),
              SizedBox(height: 24),
              Text(
                "Sections:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: course.sections.length,
                itemBuilder: (context, index) {
                  final section = course.sections[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Part ${(index + 1).toString()}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        section.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  );
                },
              ),
              // Start Learning             SizedBox(height: 24),
              SizedBox(height: 54),
            ],
          ),
        ),
      ),
    );
  }
}
