import 'package:app/src/controller/UserController.dart';
import 'package:get/get_connect.dart';
import 'package:get/get.dart';
import '../../controller/CommentController.dart';
import '../../shared/global.dart';

class CommentRepository extends GetConnect {
  final userController = Get.put(UserController());
  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.API_ROOT;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }

  Future<String> commentCreate(String content) async {
    Response response = await post(
      "/api/comment",
      {"content": content},
      headers: {'token': await userController.getToken()},
    );
    print(response.body);
    return (response.statusCode == 200) ? response.body : null;
  }

  // 댓글 목록 확인
  Future<List?> showCommentList(int id) async {
    Response response = await get(
      '/api/feed/index/1',
      headers: {'token': await userController.getToken()},
    );
    return (response.statusCode == 200) ? response.body['items'] : null;
  }
}
