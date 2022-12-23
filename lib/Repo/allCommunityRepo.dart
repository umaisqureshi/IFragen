import 'package:ifragen/Models/getCommunitiesModel.dart';
import '../Models/createCommunityModel.dart';

abstract class CommunityRepo {
  Future<GetCommunitiesModel> allCommunities();
  Future<CreateCommunityModel> createCommunities(
      String name, String description, String picture, bool isPublic);
}
