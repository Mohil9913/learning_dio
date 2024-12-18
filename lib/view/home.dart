import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leading_dio/services/post_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final PostService postService = Get.find();
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Map<String, String>>>(
            future: postService.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CupertinoActivityIndicator();
              } else if (snapshot.hasData && snapshot.data != null) {
                final postList = snapshot.data;
                return ListView.builder(
                    itemCount: postList!.length,
                    itemBuilder: (context, index) {
                      final post = postList[index];
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            ListTile(
                              title:
                                  Text('${post['title']!} : ${post['body']!}'),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(),
                          ],
                        ),
                      );
                    });
              } else {
                return Text('Something Went Wrong!');
              }
            }),
      ),
    );
  }
}
