
import 'package:dio/dio.dart' as dio;

import '../../../api/Bn_Urls.dart';
import '../../../api/base_client.dart';
import '../model/School_base_name_detail_model.dart';



class BaseSchoolRepo {
  Future<BaseSchoolIdModel> getBaseSchoolDetail({
      String? bSchoolId}
      ) async {
    try {
      dio.Response response = await BaseClient.get(url: '${Urls.baseSchoolId}$bSchoolId');
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        /*  LocalCourseModel localCourseModel =*/
        return BaseSchoolIdModel.fromJson(response.data);

        // print(localCourseModel);
        // List<Feature> featureList = localCourseModel.features!;
      } else {
        print(response.statusCode);
        throw "Base School List List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
