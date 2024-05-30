
import 'package:dio/dio.dart' as dio;

import '../../../../api/Bn_Urls.dart';
import '../../../../api/base_client.dart';
import '../model/obtain_trainee_detail_model.dart';



class ObtainTraineeRepo {
  Future<ObtainTraineeDetailModel> getObtainTraineeDetail(
      {int? id}

      ) async {
    try {
      dio.Response response = await BaseClient.get(url: '${Urls.obtainTrainee}${id}');
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        /*  LocalCourseModel localCourseModel =*/
        return ObtainTraineeDetailModel.fromJson(response.data);

        // print(localCourseModel);
        // List<Feature> featureList = localCourseModel.features!;
      } else {
        print(response.statusCode);
        throw "obtainTraineeDetail data not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
