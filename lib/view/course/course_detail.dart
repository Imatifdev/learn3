import 'package:flutter/material.dart';
import 'package:learn3/models/course_model.dart';
import 'package:learn3/view/course/learn_course.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;

  CourseDetailPage({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Thumbnail
            Image.network(
              course.thumbnail,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            
            // Course Title
            Text(
              course.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            
            // Course Points and Duration
            Row(
              children: [
                Text('Points: ${course.points}'),
                SizedBox(width: 16),
                Text('Duration: ${course.duration}'),
              ],
            ),
            SizedBox(height: 16),
            
            // Course Description
            Text(
              course.about,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            
            // Start Learning Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LearningPage(course: course),
                  ),
                );
              },
              child: Text("Start Learning"),
            ),
          ],
        ),
      ),
    );
  }
}
