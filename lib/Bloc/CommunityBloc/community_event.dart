part of 'community_bloc.dart';

abstract class CommunityEvent extends Equatable {
  const CommunityEvent();
}

class GetCommunitiesEvent extends CommunityEvent {
  @override
  List<Object?> get props => [];
}

class CreateCommunityEvent extends CommunityEvent {
  final String name;
  final String description;
  final String picture;
  final bool isPublic;

  const CreateCommunityEvent(
      {required this.description,
      required this.isPublic,
      required this.name,
      required this.picture
      });
  @override
  List<Object?> get props => [name,
   description,
   // picture,
     isPublic];
}
