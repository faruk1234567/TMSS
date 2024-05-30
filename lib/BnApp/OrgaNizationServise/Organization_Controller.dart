import 'package:get/get.dart';

import 'Organization_model.dart';
import 'Organization_repository.dart';



class OrganizationController extends GetxController{
  var organizationList =<OrganizationModel>{}.obs;


  @override
  void onInit() {
    organizationData ();

    super.onInit();
  }

  void organizationData () async {

    var response= await OrganizationRepo().getOrganizationList();
    organizationList.add(response as OrganizationModel);
    update();

  }


}