
import 'package:dio/dio.dart' as dio;

import '../../../api/Bn_Urls.dart';
import '../../../api/base_client.dart';
import '../model/get_course_detail_model.dart';



class GetCourseForSubListRepo {
  Future<GetCourseDetailModel> getCourseDetail(
  {int? courseNameId}
      ) async {
    try {
      dio.Response response = await BaseClient.get(url: '${Urls.courseNamedDetails}$courseNameId');
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        /*  LocalCourseModel localCourseModel =*/
        return GetCourseDetailModel.fromJson(response.data);

        // print(localCourseModel);
        // List<Feature> featureList = localCourseModel.features!;
      } else {
        print(response.statusCode);
        throw "Course name not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
