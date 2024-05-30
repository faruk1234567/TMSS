
import 'package:dio/dio.dart' as dio;

import '../../../../api/Bn_Urls.dart';
import '../../../../api/base_client.dart';
import '../model/Qexam_course_duration_model.dart';



class QexamCourseDetailsRepo {
  Future<QexamCourseDurationModel> getQexamCourseDurationDetail(
      int cDurationId,
      ) async {
    try {
      dio.Response response = await BaseClient.get(url: '${Urls.QcourseDetails}$cDurationId');
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        /*  LocalCourseModel localCourseModel =*/
        return QexamCourseDurationModel.fromJson(response.data);

        // print(localCourseModel);
        // List<Feature> featureList = localCourseModel.features!;
      } else {
        print(response.statusCode);
        throw "Qexam Course Duration List not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
