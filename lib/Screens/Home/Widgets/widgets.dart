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
