import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../repository/comment/CommentRepository.dart';
import '../model/CommentModel.dart';

class CommentController extends GetxController {
  final commentRepo = Get.put(CommentRepository());
  List commentList = [];
  CommentModel? commentOne;

  commentIndex(int id) async {
    List? body = await commentRepo.showCommentList(id);
    if (body == null) return false;
    List comment = body.map(((e) => CommentModel.parse(e))).toList();
    commentList = comment;
    commentList.remove(0);
    for (CommentModel i in commentList) {
      print(i.content);
    }
    update();
    return true;
  }

  // 댓글 작성
  commentCreate(String content) async {
    await commentRepo.commentCreate(content);
    await commentIndex(1);
  }
}
