part of 'community_bloc.dart';

abstract class CommunityState extends Equatable {
  const CommunityState();
}

class CommunityInitial extends CommunityState {
  @override
  List<Object?> get props => [];
}

class CommunityLoaded extends CommunityState {
  final GetCommunitiesModel getCommunities;
  const CommunityLoaded(this.getCommunities);
  @override
  List<Object?> get props => [getCommunities];
}

class CommunityCreated extends CommunityState {
  final CreateCommunityModel createCommunity;
  const CommunityCreated(this.createCommunity);
  @override
  List<Object?> get props => [createCommunity];
}

class CommunityError extends CommunityState {
  final String error;
  const CommunityError(this.error);
  @override
  List<Object?> get props => [error];
}
