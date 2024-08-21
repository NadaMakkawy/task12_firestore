import 'package:flutter/material.dart';

import '../models/comment_model.dart';
import '../repoistory/comments_repostiory.dart';

class CommentProvider with ChangeNotifier {
  List<Comment> _comments = [];
  bool _isLoading = false;
  String _error = '';

  List<Comment> get comments => _comments;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchComments(int postId) async {
    _isLoading = true;
    _error = '';

    try {
      final result = await CommentsRepository().get({'postId': postId});
      if (result.isSuscces) {
        _comments =
            (result.data as List).map((e) => Comment.fromJson(e)).toList();
      } else {
        _error = result.error;
      }
    } catch (e) {
      _error = 'Failed to load comments: $e';
    } finally {
      _isLoading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }
}
