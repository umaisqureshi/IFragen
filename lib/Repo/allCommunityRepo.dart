import 'package:ifragen/ApiServices/communityApi.dart';
import 'package:ifragen/Models/getCommunitiesModel.dart';
import '../Helper/helper.dart';
import '../Models/createCommunityModel.dart';

class CommunityRepo {
  CommunityApi communityApi = CommunityApi();

  Future<GetCommunitiesModel> allCommunities() async {
   
    return communityApi.allCommunities();
  }

  Future<CreateCommunityModel> createCommunities(
      String name, String description, String picture, bool isPublic) async {
   
    return communityApi.createCommunities(
        name, description, picture, isPublic);
  }
}
