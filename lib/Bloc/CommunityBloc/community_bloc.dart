import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ifragen/Helper/helper.dart';
import 'package:ifragen/Models/getAccesstokenModel.dart';
import 'package:ifragen/Repo/allCommunityRepo.dart';
import 'package:ifragen/Repo/userRepo.dart';

import '../../Models/createCommunityModel.dart';
import '../../Models/getCommunitiesModel.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityRepo communityRepo;
  CommunityBloc(this.communityRepo) : super(CommunityInitial()) {
    on<CommunityEvent>((event, emit) async {
      if (event is GetCommunities) {
        emit(CommunityInitial());
        try {
          GetCommunitiesModel communities =
              await communityRepo.allCommunities();
          emit(CommunityLoaded(communities));
        } catch (e) {
          print(e.toString());
          if (e.toString() == "Exception: Unauthorized") {
            print("i am in");
            GetAccessTokenModel token =
                await UserRepo().getAccessTokenfromRefreshToken();
            print(token);
            HelperClass.saveUserAccessToken(token.accessToken);
            HelperClass.saveUserRefreshToken(token.refreshToken);
            GetCommunitiesModel communities =
                await communityRepo.allCommunities();
            emit(CommunityLoaded(communities));
          } else {
            emit(CommunityError(e.toString()));
          }
        }
      }
      if (event is CreateCommunityEvent) {
        emit(CommunityInitial());
        try {
          CreateCommunityModel createCommunity =
              await communityRepo.createCommunities(
                  event.name, event.description, event.picture, event.isPublic);
          emit(CommunityCreated(createCommunity));
        } catch (e) {
          emit(CommunityError(e.toString()));
        }
      }
    });
  }
}
