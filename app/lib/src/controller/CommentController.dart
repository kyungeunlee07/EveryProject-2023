import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../repository/comment/CommentRepository.dart';

class CommentController extends GetxController {
  final commentRepo = Get.put(CommentRepository());

  commentCreate(String content) async {
    await commentRepo.commentCreate(content);
    // await commentIndex();
  }
}
