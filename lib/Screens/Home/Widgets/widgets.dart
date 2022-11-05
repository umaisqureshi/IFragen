import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Models/trendingIconModel.dart';

import '../../../Models/getCommunitiesModel.dart';

Padding trendingScrollWidget(BuildContext context, TrendingIconModel data) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Column(
      children: [
        Card(
          shape: const StadiumBorder(),
          elevation: 5,
          child: GestureDetector(
            onTap: null,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: Center(
                child: Image.asset(
                  data.icon,
                  fit: BoxFit.cover,
                  scale: 3,
                ),
              ),
            ),
          ),
        ),
        Text(
          data.title,
          style: GoogleFonts.roboto(
              color: Theme.of(context).primaryColor,
              fontSize: 8,
              fontWeight: FontWeight.normal),
        ),
      ],
    ),
  );
}
