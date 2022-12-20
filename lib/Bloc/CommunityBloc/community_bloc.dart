import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ifragen/Models/getAccesstokenModel.dart';
import 'package:ifragen/Repo/allCommunityRepo.dart';
import 'package:ifragen/Repo/userRepo.dart';

import '../../Models/createCommunityModel.dart';
import '../../Models/getCommunitiesModel.dart';
import '../../Helper/helper.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityRepo communityRepo;
  CommunityBloc(this.communityRepo) : super(CommunityInitial()) {
    on<GetCommunitiesEvent>((event, emit) async {
      try {

        emit(CommunityInitial());

        final GetCommunitiesModel allCommunities =
            await communityRepo.allCommunities();

        emit(CommunityLoadedState(allCommunities));

      } catch (e) {
        if (e.toString() == "Exception: Unauthorized") {
          GetAccessTokenModel token =
              await UserRepo().getAccessTokenFromRefreshToken();
          HelperClass.saveUserAccessToken(token.accessToken);
          HelperClass.saveUserRefreshToken(token.refreshToken);
          GetCommunitiesModel communities =
              await communityRepo.allCommunities();
          emit(CommunityLoadedState(communities));
        } else {
          emit(CommunityError(e.toString()));
        }
      }
    });

    on<CreateCommunityEvent>((event, emit) async {
      emit(CommunityInitial());
      try {
        CreateCommunityModel createCommunity =
            await communityRepo.createCommunities(
                event.name, event.description, event.picture, event.isPublic);

        emit(CommunityCreated(createCommunity));
        
      } catch (e) {
        emit(CommunityError(e.toString()));
      }
    });
  }
}
