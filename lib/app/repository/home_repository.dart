import 'dart:convert';

import '../datasource/get_animes_datasource.dart';
import '../models/anime_model.dart';

abstract class IHomeRepository {
  Future<List<AnimeModel>> getAnimes();
}

class HomeRepository implements IHomeRepository {
    final IGetAnimesDatasource getAnimeDatasource;

    const HomeRepository({required this.getAnimeDatasource,});

  @override
  Future<List<AnimeModel>> getAnimes() async{
    
    late List<AnimeModel> animes;

    var response = await getAnimeDatasource();
    animes = json.decode(response.data).map((v) => AnimeModel.fromMap(v));
    return animes;
  }
}
