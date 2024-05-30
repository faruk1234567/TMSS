
import 'package:dio/dio.dart' as dio;

import '../../../api/Bn_Urls.dart';
import '../../../api/base_client.dart';
import '../model/School_base_name_detail_model.dart';
import '../model/School_course_named_id.model.dart';



class CourseNamedIdRepo {
  Future<CourseByNamedIdModel> getCoursenamedIdDetail({
    String? cNamedId}
      ) async {
    try {
      dio.Response response = await BaseClient.get(url: '${Urls.courseNamedId}$cNamedId');
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        /*  LocalCourseModel localCourseModel =*/
        return CourseByNamedIdModel.fromJson(response.data);

        // print(localCourseModel);
        // List<Feature> featureList = localCourseModel.features!;
      } else {
        print(response.statusCode);
        throw "CourseNamed Id  List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
