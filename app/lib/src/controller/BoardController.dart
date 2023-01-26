import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/src/model/Board.dart';

import '../repository/board/boardRepository.dart';

class BoardController extends GetxController {
  final boardRepo = Get.put(BoardRepository());
  List boardList = [];

  Future<bool> boardIndex(String id) async {
    List? body = await boardRepo.showBoardList(id);
    print(body);
    if (body == null) {
      return false;
    }
    List friend = body.map(((e) => BoardModel.parse(e))).toList();
    boardList = friend;
    print(boardList.length);
    update();
    return true;
  }

  Future<bool> departmentIndex(String id) async {
    List? body = await boardRepo.showDepartmentList(id);
    print(body);
    if (body == null) {
      return false;
    }
    List friend = body.map(((e) => BoardModel.parse(e))).toList();
    boardList = friend;
    print(boardList.length);
    update();
    return true;
  }
}
