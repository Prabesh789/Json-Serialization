class Comments {
  String name;
  String email;
  String body;
  Comments.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
}
