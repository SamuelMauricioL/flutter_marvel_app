import 'package:flutter_marvel_app/core/service/center_api.dart';
import 'package:flutter_marvel_app/core/service/endpoints.dart';
import 'package:flutter_marvel_app/feature/detail/data/models/detail_model.dart';

abstract class DetailRemoteDataSource {
  Future<List<DetailModel>> getComics(String id);
  Future<List<DetailModel>> getEvents(String id);
  Future<List<DetailModel>> getSeries(String id);
  Future<List<DetailModel>> getStories(String id);
}

class DetailRemoteDataSourceImpl extends DetailRemoteDataSource {
  final CenterApi centerApi;

  DetailRemoteDataSourceImpl({required this.centerApi});

  @override
  Future<List<DetailModel>> getComics(String id) async {
    return await _getDetail(Endpoints.getComics(id));
  }

  @override
  Future<List<DetailModel>> getEvents(String id) async {
    return await _getDetail(Endpoints.getEvents(id));
  }

  @override
  Future<List<DetailModel>> getSeries(String id) async {
    return await _getDetail(Endpoints.getSeries(id));
  }

  @override
  Future<List<DetailModel>> getStories(String id) async {
    return await _getDetail(Endpoints.getStories(id));
  }

  Future<List<DetailModel>> _getDetail(String endpoint) async {
    final response = await centerApi.get(urlSpecific: endpoint);

    if (!response.isSuccess) return [];

    final body = response.result['data']['results'];
    return detailsModelFromJson(body);
  }
}
