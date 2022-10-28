import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoWifiWidget extends StatelessWidget {
  String msg;
  Color color;
  NoWifiWidget({
    required this.msg,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/wifi.png",
                    ),
                    fit: BoxFit.cover),
                // color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40))),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          msg,
          style: GoogleFonts.nunito(
              color: this.color,
              //color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class PostWidget extends StatelessWidget {
  final String image, name, email;
  const PostWidget(
      {required this.email,
      required this.image,
      required this.name,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Card(
        shape: const StadiumBorder(),
        elevation: 10,
        child: Container(
          height: size.height * 0.25,
          width: size.width * 0.96,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))),
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
                        style: GoogleFonts.nunito(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        email,
                        style: GoogleFonts.nunito(
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
                    style: GoogleFonts.nunito(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconsAndTextButton(
                      234, const Icon(Icons.arrow_upward), context),
                  iconsAndTextButton(
                      45, const Icon(Icons.arrow_downward), context),
                  iconsAndTextButton(22, const Icon(Icons.comment), context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget iconsAndTextButton(int count, Icon icon, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
        onPressed: (() {}),
        icon: icon,
        color: Theme.of(context).accentColor,
      ),
      Text(
        count.toString(),
        style: GoogleFonts.nunito(
            color: Theme.of(context).primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.bold),
      ),
    ],
  );
}
