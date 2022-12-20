// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Widgets/customwidgets.dart';

class PostWidget extends StatelessWidget {
  final String image, name, email;
  final int likes, dislike, comments;
  const PostWidget(
      {required this.email,
      required this.image,
      required this.name,
      required this.likes,
      required this.dislike,
      required this.comments,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Card(
        shape: const RoundedRectangleBorder(),
        elevation: 2,
        child: Container(
          height: size.height * 0.25,
          width: size.width * 0.96,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                image,
                              ),
                              fit: BoxFit.cover),
                          color: Theme.of(context).primaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40))),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.roboto(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        email,
                        style: GoogleFonts.roboto(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.22,
                  ),
                  IconButton(
                      onPressed: (() {}),
                      icon: Icon(
                        Icons.more_vert,
                        color: Theme.of(context).primaryColor,
                      ))
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: SizedBox(
                  height: size.height * 0.08,
                  width: size.width,
                  child: Text(
                    "What are your most important engagement values, and how will you make sure these values are reflected in the engagement process?",
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconsAndTextButton(
                      likes,
                      const Icon(
                        Icons.arrow_upward,
                        color: Colors.greenAccent,
                      ),
                      context),
                  iconsAndTextButton(
                      dislike,
                      const Icon(
                        Icons.arrow_downward,
                        color: Colors.red,
                      ),
                      context),
                  iconsAndTextButton(
                      comments,
                      const Icon(
                        Icons.comment,
                        color: Colors.blue,
                      ),
                      context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
