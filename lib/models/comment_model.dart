class Comment {
  int? id;
  int? postId;
  String? name;
  String? email;
  String? body;

  Comment();

  Comment.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    postId = data['postId'];
    name = data['name'];
    body = data['body'];
    email = data['email'];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "postId": postId,
        "name": name,
        "body": body,
        "email": email,
      };
}
