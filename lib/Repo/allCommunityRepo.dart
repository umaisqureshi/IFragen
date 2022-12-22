import 'package:ifragen/ApiServices/communityApi.dart';
import 'package:ifragen/Models/getCommunitiesModel.dart';
import '../DependencyProvider/dependencyProvider.dart';
import '../Models/createCommunityModel.dart';

class CommunityRepo {
  final _communityApi = getIt.get<CommunityApi>();

  Future<GetCommunitiesModel> allCommunities() async {
    return await _communityApi.allCommunities();
  }

  Future<CreateCommunityModel> createCommunities(
      String name, String description, String picture, bool isPublic) async {
    return await _communityApi.createCommunities(
        name, description, picture, isPublic);
  }
}
