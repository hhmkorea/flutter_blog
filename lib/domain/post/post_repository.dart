import 'package:flutter_blog/controller/dto/CMRespDto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공! => json => Dart 오브젝트

class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<void> findAll() async {
    Response response = await _postProvider
        .findAll(); // data를 Map 타입으로 await로 기다림.
    dynamic body = response.body;
    print(body);
  }
}
/*

// 에러나서 주석처리, 그냥 UTF-8 잘됨.
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<List<Post>> findAll() async {
    Response response = await _postProvider.findAll(); // data를 Map 타입으로 await로 기다림.
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body); // UTF-8 한글 깨짐 해결
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    //print(cmRespDto.code);
    //print(cmRespDto.msg);
    //print(cmRespDto.data.runtimeType);

    if(cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      //print(posts.length);
      //print(posts[0].title);
      return posts;
    } else {
      //List<Post> hello = [];
      return <Post>[];
    }
  }
}
*/
