import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/categories_widget.dart';
import '../widgets/courses_widget.dart';
import '../widgets/label_widget.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Welcome Back! ${FirebaseAuth.instance.currentUser?.displayName}'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              LabelWidget(
                name: 'Categories',
                onSeeAllClicked: () {},
              ),
              const CategoriesWidget(),
              const SizedBox(
                height: 20,
              ),
              LabelWidget(
                name: 'Top Rated Courses',
                onSeeAllClicked: () {},
              ),
              const CoursesWidget(
                rankValue: 'top rated',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
