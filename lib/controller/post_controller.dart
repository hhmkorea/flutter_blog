
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() { // 자동완성 안됨... alt+insert > override method > onInit() 선택
    super.onInit();
    findAll(); // ---> 전체 리스트 출력
  }

  Future<void> deleteById(int id) async {
    int result = await _postRepository.deleteById(id);

    if(result == 1) {
      print("서버 쪽 삭제 성공!!!");
      List<Post> result = posts.value.where((post) => post.id != id).toList(); // 3장 15강 반복문
      print(result.length);
      posts.value = result;
    }
  }

  Future<void> findAll() async {
    List<Post> posts = await _postRepository.findAll();
    this.posts.value = posts; // 통신 끝나면 값이 담김.
  }

  Future<void> findById(int id) async {
    Post post = await _postRepository.findById(id!);
    this.post.value = post;
  }
}