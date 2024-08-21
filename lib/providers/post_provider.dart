import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../repoistory/posts_repostiory.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];
  bool _isLoading = false;
  String _error = '';

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchPosts() async {
    _isLoading = true;

    final result = await PostsRepository().get();
    if (result.isSuscces) {
      _posts = (result.data as List).map((e) => Post.fromJson(e)).toList();
    } else {
      _error = result.error;
    }

    _isLoading = false;
    notifyListeners();
  }
}
