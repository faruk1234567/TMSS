
import 'package:dio/dio.dart' as dio;

import '../../../../api/Bn_Urls.dart';
import '../../../../api/base_client.dart';
import '../model/Course_name_detail_model.dart';


class CourseNameDetailsRepo {
  Future<CourseNameDetail> getCourseNameDetailServise(
      int courseNameId,
      ) async {
    try {
      dio.Response response = await BaseClient.get(url: '${Urls.courseNameDetails}$courseNameId');
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        /*  LocalCourseModel localCourseModel =*/
        return CourseNameDetail.fromJson(response.data);

        // print(localCourseModel);
        // List<Feature> featureList = localCourseModel.features!;
      } else {
        print(response.statusCode);
        throw "Course Name Detail List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
