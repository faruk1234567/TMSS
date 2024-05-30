import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Repository/Budget_repository.dart';
import '../model/Budget_model.dart';



class BudgetController extends GetxController {
  RxList<Budget> BudgetList = <Budget>[].obs;

  var isLoading = false.obs;

  getBudgetData() async {
    isLoading.value = true;
    var response = await BudgetRepo().getBudget();
    BudgetList.value = response;
    isLoading.value = false;
  }

  @override
  void onInit() {
    getBudgetData();
    super.onInit();
  }
}
