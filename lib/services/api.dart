import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sputnik_test_app/models/followers_model.dart';
import 'package:sputnik_test_app/models/following_model.dart';
import 'package:sputnik_test_app/models/repos_model.dart';

typedef Json = Map<String, String>;

class API {
  API._();
  static late final API _instance = API._();

  factory API() {
    return _instance;
  }

  String _baseUrl = 'https://api.github.com/users/GantMan';

  Future<String> _request(String path) async {
    var resp = await http.get(Uri.parse(_baseUrl + path));
    return resp.body;
  }

  Future<String> getProfile() async {
    return await _request('');
  }

  Future<List<FollowersModel>> getFollowers() async {
    return (json.decode(await _request('/followers')) as List)
        .map((e) => FollowersModel.fromMap(e))
        .toList();
  }

  Future<List<FollowingModel>> getFollowing() async {
    return (json.decode(await _request('/following')) as List)
        .map((e) => FollowingModel.fromMap(e))
        .toList();
  }

  Future<List<ReposModel>> getRepos() async {
    return (json.decode(await _request('/repos')) as List)
        .map((e) => ReposModel.fromMap(e))
        .toList();
  }
}
