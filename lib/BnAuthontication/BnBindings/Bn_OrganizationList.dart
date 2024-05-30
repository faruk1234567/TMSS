import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../BnApp/OrgaNizationServise/Organization_Controller.dart';


class OrganizationListBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OrganizationController());
    

  }

}