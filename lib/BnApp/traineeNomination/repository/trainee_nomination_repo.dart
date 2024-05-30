import 'package:dio/dio.dart' as dio;
import 'package:navy_project/api/Bn_Urls.dart';
import 'package:navy_project/api/base_client.dart';

import '../models/trainee_nomination_model.dart';

class TraineeNominationRepo {
  static Future<List<TraineeNominationModel>> nominationApiCall({int? courseDurationId}) async {
    try {
      dio.Response response = await BaseClient.get(url: Urls.traineeNominationUrl + courseDurationId.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        List<TraineeNominationModel> nominee = [];
        List list = response.data;

        for (var i in list) {
          nominee.add(TraineeNominationModel.fromJson(i));
        }
        return nominee;
      } else {
        print("${response.statusCode}");
      }
      throw "${response.statusMessage}";
    } catch (e) {
      rethrow;
    }
  }
}
