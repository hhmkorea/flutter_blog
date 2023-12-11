import 'package:flutter_blog/controller/dto/CMRespDto.dart';
import 'package:flutter_blog/controller/dto/UpdateReqDto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:get/get.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공! => json => Dart 오브젝트
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<Post> updateById(int id, String title, String content) async {
    UpdateReqDto updateReqDto = UpdateReqDto(title, content);
    Response response = await _postProvider.updateById(id, updateReqDto.toJson());
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if(cmRespDto.code == 1) {
      print("수정 성공");
      Post post = Post.fromJson(cmRespDto.data); // 수정된 내용으로 변경.
      return post;
    } else {
      print("수정 실패");
      return Post();
    }
  }

  Future<int> deleteById(int id) async {
    Response response = await _postProvider.deleteById(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    return cmRespDto.code ?? -1;
  }

  Future<Post> findById(int id) async {
    Response response = await _postProvider.findById(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    } else {
      return Post();
    }
  }

  Future<List<Post>> findAll() async {
    Response response = await _postProvider.findAll(); // data를 Map 타입으로 await로 기다림.
    dynamic body = response.body;
    // 41강 한글 깨지는거 utf-8 변환부분인데 깨지지 않아서 할 필요 없음. -------------
    // dynamic convertBody = convertUtf8ToObject(body);
    // CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    // -----------------------------------------------------------------------
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      return <Post>[];
    }
  }
}
