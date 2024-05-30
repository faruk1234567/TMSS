
import 'package:dio/dio.dart' as dio;

import '../../../../api/Bn_Urls.dart';
import '../../../../api/base_client.dart';
import '../model/obtain_course_duration_detail_model.dart';



class ObtainCourseDurationRepo {
  Future<ObtainCourseDurationDetailModel> getObtainCourseDurationDetail(
      {int? id}

      ) async {
    try {
      dio.Response response = await BaseClient.get(url: '${Urls.obtainCdDetail}${id}');
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        /*  LocalCourseModel localCourseModel =*/
        return ObtainCourseDurationDetailModel.fromJson(response.data);

        // print(localCourseModel);
        // List<Feature> featureList = localCourseModel.features!;
      } else {
        print(response.statusCode);
        throw "obtainCourseDuration data not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
