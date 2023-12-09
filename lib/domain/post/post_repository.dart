import 'package:flutter_blog/controller/dto/CMRespDto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공! => json => Dart 오브젝트
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<void> findAll() async {
    Response response = await _postProvider.findAll(); // data를 Map 타입으로 await로 기다림.
    dynamic body = response.body;
    // 41강 한글 깨지는거 utf-8 변환부분인데 깨지지 않아서 할 필요 없음. -------------
    // dynamic convertBody = convertUtf8ToObject(body);
    // CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    // -----------------------------------------------------------------------
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    print(cmRespDto.code);
    print(cmRespDto.msg);
    print(cmRespDto.data.runtimeType);

    if (cmRespDto.code == 1) {
    } else {
    }
  }
}
