import 'dart:convert';


import 'package:http/http.dart' as http;

import 'Organization_model.dart';

class OrganizationRepo {
  Future<List<OrganizationModel>> getOrganizationList() async {
    try {
      var response = await http.get(Uri.parse('http://123.253.147.242:7775/api/sms/base-school-name/get-organizationsList'));
      //dio.Response response= await BaseClient.get(url: Urls.organizationsList);
      var decodeProducts = json.decode(response.body).cast<Map<String, dynamic>>();
      List<OrganizationModel> organizationList = await decodeProducts.map<OrganizationModel>((json) => OrganizationModel.fromJson(json)).toList();
      return organizationList;

      /*if(response.statusCode==200){
        //var decodeOrganization=json.decode(response.)
        OrganizationModel organizationModel=OrganizationModel.fromJson(response.data);
        List<OrganizationModel> orgalist=organizationModel.f
         return organizationModel;




      }else{
        Get.snackbar('Fail', 'Data Upload Fail');
        throw Exception();
      }*/
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
