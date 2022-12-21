import 'package:ifragen/ApiServices/communityApi.dart';
import 'package:ifragen/Models/getCommunitiesModel.dart';
import '../Models/createCommunityModel.dart';

class CommunityRepo {
 final CommunityApi _communityApi = CommunityApi();

  Future<GetCommunitiesModel> allCommunities() async {
   
    return _communityApi.allCommunities();
  }

  Future<CreateCommunityModel> createCommunities(
      String name, String description, String picture, bool isPublic) async {
   
    return _communityApi.createCommunities(
        name, description, picture, isPublic);
  }
}
