
import 'package:dio/dio.dart' as dio;

import '../../../../../api/Bn_Urls.dart';
import '../../../../../api/base_client.dart';
import '../model/sta_model.dart';



class ScollegeListRepo {
  Future<SCListModel> getSCollegeCourseDurationDetail(
      int cDurationId,
      ) async {
    try {
      dio.Response response = await BaseClient.get(url: '${Urls.sCollegeList}$cDurationId');
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        /*  LocalCourseModel localCourseModel =*/
        return SCListModel.fromJson(response.data);

        // print(localCourseModel);
        // List<Feature> featureList = localCourseModel.features!;
      } else {
        print(response.statusCode);
        throw "StaffCollege Name not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
