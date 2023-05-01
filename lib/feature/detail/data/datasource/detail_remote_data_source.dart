import 'package:flutter_marvel_app/core/service/center_api.dart';
import 'package:flutter_marvel_app/core/service/endpoints.dart';
import 'package:flutter_marvel_app/feature/detail/data/models/detail_model.dart';

abstract class DetailRemoteDataSource {
  Future<List<DetailModel>> getComics(String id);
}

class DetailRemoteDataSourceImpl extends DetailRemoteDataSource {
  final CenterApi centerApi;

  DetailRemoteDataSourceImpl({required this.centerApi});

  @override
  Future<List<DetailModel>> getComics(String id) async {
    final response = await centerApi.get(urlSpecific: Endpoints.getComics(id));

    if (!response.isSuccess) return [];

    final body = response.result['data']['results'];
    return detailsModelFromJson(body);
  }
}
