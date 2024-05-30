
import 'package:dio/dio.dart' as dio;

import '../../../../api/Bn_Urls.dart';
import '../../../../api/base_client.dart';
import '../model/nameOfThe_model.dart';



class NameOfTheCourseRepo {
  Future<NameOftheCourseModel> getNameOfTheCourseDetail(
  {int? id}
      ) async {
    try {
      dio.Response response = await BaseClient.get(url: Urls.NameOfTheCourse+id.toString());
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        /*  LocalCourseModel localCourseModel =*/
        return NameOftheCourseModel.fromJson(response.data);

        // print(localCourseModel);
        // List<Feature> featureList = localCourseModel.features!;
      } else {
        print(response.statusCode);
        throw "Name Of The Course  not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
