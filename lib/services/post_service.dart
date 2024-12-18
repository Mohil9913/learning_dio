import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PostService extends GetxService {
  Future<List<Map<String, String>>> fetchData() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      return (response.data as List).map((post) {
        return {
          'title': post['title'] as String,
          'body': post['body'] as String
        };
      }).toList();
    } catch (e) {
      Get.snackbar('Error Fetching Data', '$e');
      return [];
    }
  }
}
