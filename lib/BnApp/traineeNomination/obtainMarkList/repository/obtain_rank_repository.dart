
import 'package:dio/dio.dart' as dio;

import '../../../../api/Bn_Urls.dart';
import '../../../../api/base_client.dart';
import '../model/obtain_trainee_degigntion_model.dart';


class ObtainRankRepo {
  Future<ObtainRankModel> getObtainRankDetail(
      {int? id}

      ) async {
    try {
      dio.Response response = await BaseClient.get(url: '${Urls.obtainRankId}${id}');
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        /*  LocalCourseModel localCourseModel =*/
        return ObtainRankModel.fromJson(response.data);

        // print(localCourseModel);
        // List<Feature> featureList = localCourseModel.features!;
      } else {
        print(response.statusCode);
        throw "Rankwise data not Upload ";
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
