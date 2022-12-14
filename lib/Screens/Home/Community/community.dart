import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Bloc/CommunityBloc/community_bloc.dart';
import 'package:ifragen/Constant/constant.dart';
import 'package:ifragen/Models/getCommunitiesModel.dart';
import 'package:ifragen/Screens/Home/Community/communityMainPage.dart';

import 'CreateCommunity/createCommunity.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CommunityBloc()..add(GetCommunitiesEvent()),
        ),
      ],
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 20,
          hoverColor: Theme.of(context).primaryColor,
          hoverElevation: 50,
          shape: const StadiumBorder(),
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const CreateCommunityScreen())));
          },
        ),
        body: BlocConsumer<CommunityBloc, CommunityState>(
            builder: ((context, state) {
          // if (state is CommunityInitial) {
          //   return Center(
          //     child: CircularProgressIndicator(
          //       color: Theme.of(context).primaryColor,
          //       strokeWidth: 4,
          //     ),
          //   );
          // }

          if (state is CommunityLoadedState) {
            GetCommunitiesModel community = state.getAllCommunities;
            if (community.communities.isNotEmpty) {
              return ListView.builder(
                key: const PageStorageKey<String>("page"),
                itemCount: community.communities.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.1,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => CommunityMainScreen(
                                  communitiesData:
                                      community.communities[index]))));
                        },
                        child: ListTile(
                          subtitle: community.communities[index].isPublic
                              ? Text(
                                  "Public",
                                  style: GoogleFonts.roboto(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                )
                              : Text(
                                  "Private",
                                  style: GoogleFonts.roboto(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                          title: Text(
                            community.communities[index].name,
                            style: GoogleFonts.roboto(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      community.communities[index].picture
                                              .isEmpty
                                          ? "https://media.istockphoto.com/vectors/people-family-together-human-unity-chat-bubble-vector-icon-vector-id1198036466?k=20&m=1198036466&s=612x612&w=0&h=QSpwvOA8_Gwkr8CYqDIvNGhTBurzIYjAkE-dfzlIOO8="
                                          : IMAGE_END_POINT +
                                              state.getAllCommunities
                                                  .communities[index].picture,
                                    ),
                                    fit: BoxFit.cover),
                                color: Theme.of(context).primaryColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40))),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            }
          }
          return Center(
            child: Text(
              "No Community Found",
              style: GoogleFonts.roboto(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          );
        }), listener: ((context, state) {
          if (state is CommunityError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                margin:
                    const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
                backgroundColor: Theme.of(context).primaryColor,
                shape: const StadiumBorder(),
                elevation: 30,
                padding: const EdgeInsets.all(20),
                content: Text(
                  state.error,
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )));
          }
        })),
      ),
    );
  }
}
