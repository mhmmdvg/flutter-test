import 'package:dio/dio.dart';
import 'package:flutter_application_test/models/post.dart';

class RemoteDatasource {
  final dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  Future<PostData> getPost() async {
    final response = await dio.get('/posts');

    return PostData.fromJson(response.data);
  }

  Future<Post> getDetailPost(int id) async {
    final response = await dio.get('/posts/$id');

    return Post.fromModel(response.data);
  }
}
