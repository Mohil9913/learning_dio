import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leading_dio/services/post_service.dart';
import 'package:leading_dio/view/home.dart';

void main() {
  Get.lazyPut<PostService>(() => PostService());

  runApp(
    GetMaterialApp(
      home: Home(),
    ),
  );
}
