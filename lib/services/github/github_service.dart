import 'package:erudaxis/core/constants/env.dart';
import 'package:erudaxis/models/github/github_release.dart';
import 'package:erudaxis/services/base_service.dart';

import '../../core/api/api_response.dart';
import '../../core/api/api_services.dart';

class GithubService extends BaseService<GithubRelease> {
  static final GithubService _instance = GithubService._internal();

  static GithubService get shared => _instance;

  GithubService._internal();
  @override
  String get endpoint => gitHubURl;

  @override
  GithubRelease Function(dynamic json) get fromMapFunction =>
      GithubRelease.fromMap;

  Future<ApiResponse<GithubRelease>> getLastRelease() async {
    return ApiService.instance.request<GithubRelease>(
      url: endpoint,
      fromJson: fromMapFunction,
      authRequired: false,
      githubToken: gitHubToken,
    );
  }
}
