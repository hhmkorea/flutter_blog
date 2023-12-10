
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;

  @override
  void onInit() { // 자동완성 안됨... alt+insert > override method > onInit() 선택
    super.onInit();
    //print(">>>>>>>>>>>> PostController---> onInit();");
    findAll();
  } // ---> 관찰 가능한 변수

  Future<void> findAll() async {
    List<Post> posts = await _postRepository.findAll();
    this.posts.value = posts; // 통신 끝나면 값이 담김.
  }
}