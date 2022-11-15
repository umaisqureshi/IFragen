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
          style: GoogleFonts.roboto(
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
        shape: const RoundedRectangleBorder(),
        elevation: 2,
        child: Container(
          height: size.height * 0.25,
          width: size.width * 0.96,
          decoration: const BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.all(
            //   Radius.circular(30),
            //  ),
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
                      234,
                      const Icon(
                        Icons.arrow_upward,
                        color: Colors.greenAccent,
                      ),
                      context),
                  iconsAndTextButton(
                      45,
                      const Icon(
                        Icons.arrow_downward,
                        color: Colors.red,
                      ),
                      context),
                  iconsAndTextButton(
                      22,
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

Widget iconsAndTextButton(
  int count,
  Icon icon,
  BuildContext context,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
        onPressed: null,
        icon: icon,
        color: Theme.of(context).accentColor,
      ),
      Text(
        count.toString(),
        style: GoogleFonts.roboto(
            color: Theme.of(context).primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.bold),
      ),
    ],
  );
}



class ProfileEditTileWidget extends StatefulWidget {
  final String title, value;

  const ProfileEditTileWidget({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileEditTileWidget> createState() => _ProfileEditTileWidgetState();
}

class _ProfileEditTileWidgetState extends State<ProfileEditTileWidget> {
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            widget.title,
            style: GoogleFonts.roboto(
                color: Theme.of(context).primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: 5),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              key: widget.key,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.4,
                    blurRadius: 7,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    isEdit
                        ? TextField(
                            textAlign: TextAlign.justify,
                            showCursor: true,
                            cursorColor: Theme.of(context).primaryColor,
                            onChanged: (value) {},
                            style: GoogleFonts.roboto(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10.0),
                              focusColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintTextDirection: TextDirection.ltr,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: widget.value,
                              hintStyle: GoogleFonts.roboto(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                          )
                        : Text(
                            widget.value,
                            style: GoogleFonts.roboto(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                    Positioned(
                      right: -25,
                      bottom: -7,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isEdit = !isEdit;
                            });
                          },
                          child: Container(
                            key: widget.key,
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              isEdit ? Icons.check : Icons.edit,
                              color: Theme.of(context).primaryColor,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
