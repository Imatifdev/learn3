import 'package:flutter/material.dart';
import 'package:learn3/utility/buttonRow.dart';
import 'package:learn3/utility/cryptocard.dart';
import 'package:learn3/utility/lessoncard.dart';
import 'package:learn3/view/course/course_detail.dart';
import 'package:learn3/view/home/explore.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf6fafe),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Muhammad',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF545f71),
                          fontWeight: FontWeight
                              .bold), // You can customize the text style
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Expolre',
                      style: TextStyle(
                          fontSize: 26,
                          color: Color(0xFF545f71),
                          fontWeight: FontWeight
                              .bold), // You can customize the text style
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.token,
                        color: Colors.yellow,
                      ),
                      Text(
                        "1K ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                      Icon(
                        Icons.info,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: const Color(0xFFB0BEC5), // Border color
                  width: 1.5,
                ),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Color(0xFFB0BEC5), // Hint text color
                  ),
                  icon: Icon(Icons.search, color: Colors.black),
                  border: InputBorder.none, // Remove default underline border
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Topics',
                  style: TextStyle(
                      fontSize: 23,
                      color: Color(0xFF545f71),
                      fontWeight:
                          FontWeight.bold), // You can customize the text style
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/coursesHome');
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(
                          0xFF5C6672), // Adjust the color to match your design
                      decoration:
                          TextDecoration.underline, // Underline the text
                      decorationColor: Color(0xFF5C6672), // Underline color
                      decorationThickness: 1.5, // Thickness of the underline
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            ButtonRow(),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Most Popular',
                  style: TextStyle(
                      fontSize: 23,
                      color: Color(0xFF545f71),
                      fontWeight:
                          FontWeight.bold), // You can customize the text style
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(
                        0xFF5C6672), // Adjust the color to match your design
                    decoration: TextDecoration.underline, // Underline the text
                    decorationColor: Color(0xFF5C6672), // Underline color
                    decorationThickness: 1.5, // Thickness of the underline
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 240, // Set the desired height for the ListView
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CourseDetailPage(course: course),
                            ),
                          );
                        },
                        child: CryptoCard(
                            imageUrl: course.thumbnail,
                            title: course.title,
                            //  subtitle: course.about,
                            time: course.duration,
                            points: course.points),
                      ));
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Most Popular',
                  style: TextStyle(
                      fontSize: 23,
                      color: Color(0xFF545f71),
                      fontWeight:
                          FontWeight.bold), // You can customize the text style
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(
                        0xFF5C6672), // Adjust the color to match your design
                    decoration: TextDecoration.underline, // Underline the text
                    decorationColor: Color(0xFF5C6672), // Underline color
                    decorationThickness: 1.5, // Thickness of the underline
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return LessonCard(
                    title: courses[index].title,
                    subtitle: courses[index].title,
                    time: courses[index].duration,
                    points: courses[index].points,
                    imagePath: courses[index].thumbnail,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
