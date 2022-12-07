import 'package:dio/dio.dart';

import '../consts/app_consts.dart';

abstract class IGetAnimesDatasource {
  Future<dynamic> call();
}

class GetAnimesDatasource implements IGetAnimesDatasource {
  final Dio dio = Dio();

  GetAnimesDatasource();

  @override
  Future call() async {
    var response = await dio.get(AppConsts.baseUrl);
    return response;
  }
}
