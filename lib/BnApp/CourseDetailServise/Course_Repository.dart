
import 'package:dio/dio.dart' as dio;

import '../../api/Bn_Urls.dart';
import '../../api/base_client.dart';
import 'Course_model.dart';

class CourseDetailsRepo {
  Future<GetCourseDurationDetail> getCourseDurationDetail(
      int cDurationId,
      ) async {
    try {
      dio.Response response = await BaseClient.get(url: '${Urls.courseDetails}$cDurationId');
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        /*  LocalCourseModel localCourseModel =*/
        return GetCourseDurationDetail.fromJson(response.data);

        // print(localCourseModel);
        // List<Feature> featureList = localCourseModel.features!;
      } else {
        print(response.statusCode);
        throw "Course List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
