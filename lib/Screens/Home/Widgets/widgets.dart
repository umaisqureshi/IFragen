import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Models/getCommunitiesModel.dart';

Padding trendingScrollWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Card(
      shape: const StadiumBorder(),
      elevation: 5,
      child: Container(
        width: 70,
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: Icon(
          Icons.account_tree,
          color: Theme.of(context).primaryColor,
        ),
      ),
    ),
  );
}

class CommunityTileWidget extends StatelessWidget {
  CommunityTileWidget(
      {Key? key,
      required this.size,
      required this.communitiesModel,
      required this.index})
      : super(key: key);

  final Size size;
  int index;
  GetCommunitiesModel communitiesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: const StadiumBorder(),
        elevation: 8,
        child: Container(
          height: size.height * 0.1,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            subtitle: communitiesModel.communities[index].isPublic
                ? Text(
                    "Public",
                    style: GoogleFonts.nunito(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  )
                : Text(
                    "Private",
                    style: GoogleFonts.nunito(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
            title: Text(
              communitiesModel.communities[index].name,
              style: GoogleFonts.nunito(
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
                        communitiesModel.communities[index].picture,
                      ),
                      fit: BoxFit.cover),
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(40))),
            ),
          ),
        ),
      ),
    );
  }
}
