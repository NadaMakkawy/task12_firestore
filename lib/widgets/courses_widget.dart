import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task12_firestore/pages/course_page.dart';
import '../utils/color_utilis.dart';
import '../models/course.dart';
import 'package:flutter/material.dart';

class CoursesWidget extends StatefulWidget {
  final String rankValue;
  const CoursesWidget({required this.rankValue, super.key});

  @override
  State<CoursesWidget> createState() => _CoursesWidgetState();
}

class _CoursesWidgetState extends State<CoursesWidget> {
  late Future<QuerySnapshot<Map<String, dynamic>>> futureCall;

  @override
  void initState() {
    futureCall = FirebaseFirestore.instance
        .collection('courses')
        // .where('rank', isEqualTo: widget.rankValue)
        .orderBy('created_date', descending: true)
        .get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureCall,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Error occurred'),
            );
          }

          if (!snapshot.hasData || (snapshot.data?.docs.isEmpty ?? false)) {
            return const Center(
              child: Text('No categories found'),
            );
          }

          var courses = List<Course>.from(snapshot.data?.docs
                  .map((e) => Course.fromJson({'id': e.id, ...e.data()}))
                  .toList() ??
              []);

          return GridView.count(
            childAspectRatio: 1.5,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(courses.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoursePage(
                        courseTitle:
                            '${courses[index].title ?? 'No Title'} Course',
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorUtility.grayExtraLight,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(courses[index].title ?? 'No Title'),
                  ),
                ),
              );
            }),
          );
        });
  }
}
