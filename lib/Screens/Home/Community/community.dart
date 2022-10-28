import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 20,
        hoverColor: Theme.of(context).primaryColor,
        hoverElevation: 50,
        shape: const StadiumBorder(),
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: ((context, index) {
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
                  subtitle: Text(
                    "Community type",
                    style: GoogleFonts.nunito(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                  title: Text(
                    "Community Name",
                    style: GoogleFonts.nunito(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                              "assets/splashicon.png",
                            ),
                            fit: BoxFit.cover),
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40))),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
