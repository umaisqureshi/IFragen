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

class QuestionDetailedPage extends StatefulWidget {
  final String name;
  final String question;

  const QuestionDetailedPage(
      {super.key, required this.name, required this.question});

  @override
  State<QuestionDetailedPage> createState() => _QuestionDetailedPageState();
}

class _QuestionDetailedPageState extends State<QuestionDetailedPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 20,
            hoverColor: Theme.of(context).primaryColor,
            hoverElevation: 50,
            shape: const StadiumBorder(),
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          "assets/splashimage2.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(40))),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Username",
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "What are your most important engagement values, and how will you make sure these values are reflected in the engagement process?",
                            style: GoogleFonts.roboto(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Card(
                  elevation: 8,
                  borderOnForeground: true,
                  shadowColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      color: Colors.white,
                    ),
                    //color: Theme.of(context).primaryColor),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Answers",
                            style: GoogleFonts.roboto(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Card(
                              elevation: 6,
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.justify,
                                cursorColor: Theme.of(context).primaryColor,
                                onChanged: (value) {},
                                style: GoogleFonts.roboto(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: Theme.of(context).primaryColor,
                                    size: 20,
                                  ),
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
                                  hintText: "Search",
                                  hintStyle: GoogleFonts.roboto(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.57,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 30,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5),
                                child: Card(
                                  elevation: 4,
                                  child: Container(
                                    height: MediaQuery.of(context).size.width *
                                        0.37,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Username",
                                            style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            child: Text(
                                              "What are your most important engagement values, and how will you make sure these values are reflected in the engagement process?",
                                              maxLines: 3,
                                              style: GoogleFonts.roboto(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              iconsAndTextButton(
                                                  10,
                                                  const Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  ),
                                                  context),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              iconsAndTextButton(
                                                  1,
                                                  const Icon(
                                                    Icons.comment,
                                                    color: Colors.blue,
                                                  ),
                                                  context)
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              
              ],
            ),
          )),
    );
  }
}
