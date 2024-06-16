class PostData {
  final List<Post> data;

  PostData({required this.data});

  factory PostData.fromJson(List<dynamic> json) =>
      PostData(data: List.from(json.map((post) => Post.fromModel(post))));
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromModel(Map<String, dynamic> json) => Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']);
}
