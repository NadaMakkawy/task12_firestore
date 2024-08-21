class Post {
  int? id;
  int? userId;
  String? title;
  String? body;

  Post();

  Post.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    userId = data['userId'];
    title = data['title'];
    body = data['body'];
  }

  Map<String, dynamic> toJson() =>
      {"id": id, "userId": userId, "title": title, "body": body};
}
