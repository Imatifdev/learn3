import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String points;
  final String imagePath;

  LessonCard({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.points,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFf6fafe),
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              child: Image.network(
                imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF545f71)),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        "Learn 3",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '• $time',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: Color(0xFF2b5680),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                '$points pts',
                style: TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
