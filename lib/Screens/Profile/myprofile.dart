import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Widgets/profileEditTileWidget.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var name = "Umais Qureshi";
  var email = "Muhammad.rashid@fau.de";
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 7,
                    shape: const StadiumBorder(),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          color: Colors.white),
                      child: CachedNetworkImage(
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.8),
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          color: Theme.of(context).primaryColor,
                        ),
                        imageUrl:
                            "https://images.pexels.com/photos/846741/pexels-photo-846741.jpeg?auto=compress&cs=tinysrgb&w=800",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    name,
                    style: GoogleFonts.roboto(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    email,
                    style: GoogleFonts.roboto(
                        color: Colors.black54,
                        fontSize: 13,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          "Communities".toUpperCase(),
                          style: GoogleFonts.roboto(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "54",
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          "QUESTIONS",
                          style: GoogleFonts.roboto(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "32",
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: Card(
                elevation: 10,
                borderOnForeground: true,
                shadowColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 7,
                          offset:
                              const Offset(6, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white,
                    ),
                    //color: Theme.of(context).primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView(
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          ProfileEditTileWidget(
                            title: "Username",
                            value: "Umais Qureshi",
                            key: Key("1"),
                          ),
                          ProfileEditTileWidget(
                            title: "Email",
                            value: "umaisqureshi26@icloud.com",
                            key: Key("2"),
                          ),
                          ProfileEditTileWidget(
                            title: "University",
                            value: "FAU",
                            key: Key("3"),
                          ),
                          ProfileEditTileWidget(
                            title: "Semester",
                            value: "2",
                            key: Key("4"),
                          ),
                          ProfileEditTileWidget(
                            title: "Country",
                            value: "Pakistan",
                            key: Key("5"),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
