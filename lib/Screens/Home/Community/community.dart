import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Bloc/CommunityBloc/community_bloc.dart';
import 'package:ifragen/Repo/allCommunityRepo.dart';

import '../Widgets/widgets.dart';
import 'CreateCommunity/createCommunity.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  CommunityBloc communityBloc = CommunityBloc(CommunityRepo());
  @override
  void initState() {
    communityBloc.add(GetCommunities());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          CommunityBloc(RepositoryProvider.of<CommunityRepo>(context)),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
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
          if (state is CommunityInitial) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
                strokeWidth: 2,
              ),
            );
          }

          if (state is CommunityLoaded) {
            print(state.getCommunities.communities.length);
            return state.getCommunities.communities.isEmpty
                ? Center(
                    child: Text(
                      "No Community Found",
                      style: GoogleFonts.nunito(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    itemCount: state.getCommunities.communities.length,
                    itemBuilder: ((context, index) {
                      return CommunityTileWidget(
                        size: size,
                        communitiesModel: state.getCommunities,
                        index: index,
                      );
                    }),
                  );
          }
          return Center(
            child: Text(
              "No Community Found",
              style: GoogleFonts.nunito(
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
                  style: GoogleFonts.nunito(
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
