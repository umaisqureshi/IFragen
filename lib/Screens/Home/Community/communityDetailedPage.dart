import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Constant/constant.dart';
import 'package:ifragen/Models/getCommunitiesModel.dart';

class CommunityDetailedPage extends StatefulWidget {
  final Community communityDetail;
  const CommunityDetailedPage({super.key, required this.communityDetail});

  @override
  State<CommunityDetailedPage> createState() => _CommunityDetailedPage();
}

class _CommunityDetailedPage extends State<CommunityDetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  // image: NetworkImage(widget.communityDetail.picture),
                  image: AssetImage("assets/splashimage2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Center(
                        child: Text(
                          widget.communityDetail.name,
                          style: GoogleFonts.roboto(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          widget.communityDetail.description,
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Members",
                              style: GoogleFonts.roboto(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Card(
                              elevation: 5,
                              child: Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "34",
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 30,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(),
                                child: Container(
                                  height: 70,
                                  color: Colors.white,
                                  child: Center(
                                    child: ListTile(
                                      title: Text(
                                        "Member name",
                                        style: GoogleFonts.roboto(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      leading: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: NetworkImage(
                                                    "https://media.istockphoto.com/vectors/people-family-together-human-unity-chat-bubble-vector-icon-vector-id1198036466?k=20&m=1198036466&s=612x612&w=0&h=QSpwvOA8_Gwkr8CYqDIvNGhTBurzIYjAkE-dfzlIOO8="),
                                                fit: BoxFit.cover),
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(40))),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

    //   CustomScrollView(
    //     slivers: [
    //       SliverAppBar(
    //         leading: IconButton(
    //           icon: const Icon(Icons.arrow_back, color: Colors.white),
    //           onPressed: () => Navigator.of(context).pop(),
    //         ),
    //         expandedHeight: 150.0,
    //         flexibleSpace: FlexibleSpaceBar(
    //           // title: Text(widget.communityDetail.name),
    //           background: Image.asset(
    //             "assets/splashimage2.jpg",
    //             fit: BoxFit.cover,
    //           ),
    //           // background: Image.network(
    //           //   IMAGE_END_POINT + widget.communityDetail.picture,
    //           //   fit: BoxFit.fill,
    //           // ),
    //         ),
    //       ),
    //       SliverList(
    //           delegate: SliverChildListDelegate([
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               Center(
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text(
    //                       widget.communityDetail.name,
    //                       style: GoogleFonts.roboto(
    //                           color: Theme.of(context).primaryColor,
    //                           fontSize: 20,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                     Center(
    //                       child: Card(
    //                         elevation: 10,
    //                         shape: const StadiumBorder(),
    //                         child: Container(
    //                           height: 40,
    //                           width: MediaQuery.of(context).size.width * 0.2,
    //                           decoration: BoxDecoration(
    //                               color: Theme.of(context).accentColor,
    //                               borderRadius: const BorderRadius.all(
    //                                 Radius.circular(30),
    //                               )),
    //                           child: Center(
    //                             child: Text(
    //                               "Leave",
    //                               style: GoogleFonts.roboto(
    //                                   color: Theme.of(context).primaryColor,
    //                                   fontSize: 15,
    //                                   fontWeight: FontWeight.bold),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               Text(
    //                 "Description",
    //                 style: GoogleFonts.roboto(
    //                     color: Theme.of(context).primaryColor,
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.bold),
    //               ),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               Text(
    //                 widget.communityDetail.description,
    //                 style: GoogleFonts.roboto(
    //                     color: Colors.black,
    //                     fontSize: 12,
    //                     fontWeight: FontWeight.normal),
    //               ),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     "Members",
    //                     style: GoogleFonts.roboto(
    //                         color: Theme.of(context).primaryColor,
    //                         fontSize: 20,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                   Card(
    //                     elevation: 10,
    //                     child: Container(
    //                       height: 40,
    //                       width: 70,
    //                       decoration: BoxDecoration(
    //                           color: Theme.of(context).primaryColor,
    //                           borderRadius:
    //                               BorderRadius.all(Radius.circular(10))),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                         children: [
    //                           const Icon(
    //                             Icons.person,
    //                             color: Colors.white,
    //                           ),
    //                           Text(
    //                             "34",
    //                             style: GoogleFonts.roboto(
    //                                 color: Colors.white,
    //                                 fontSize: 12,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               Container(
    //                 height: MediaQuery.of(context).size.height * 0.5,
    //                 child: ListView.builder(
    //                     shrinkWrap: true,
    //                     physics: const BouncingScrollPhysics(),
    //                     itemCount: 30,
    //                     itemBuilder: ((context, index) {
    //                       return Padding(
    //                         padding: const EdgeInsets.symmetric(vertical: 5.0),
    //                         child: Card(
    //                           elevation: 5,
    //                           color: Colors.white,
    //                           child: ListTile(
    //                             title: Text(
    //                               "Member name",
    //                               style: GoogleFonts.roboto(
    //                                   color: Theme.of(context).primaryColor,
    //                                   fontSize: 14,
    //                                   fontWeight: FontWeight.bold),
    //                             ),
    //                             leading: Container(
    //                               height: 60,
    //                               width: 60,
    //                               decoration: BoxDecoration(
    //                                   image: const DecorationImage(
    //                                       image: NetworkImage(
    //                                           "https://media.istockphoto.com/vectors/people-family-together-human-unity-chat-bubble-vector-icon-vector-id1198036466?k=20&m=1198036466&s=612x612&w=0&h=QSpwvOA8_Gwkr8CYqDIvNGhTBurzIYjAkE-dfzlIOO8="),
    //                                       fit: BoxFit.cover),
    //                                   color: Theme.of(context).primaryColor,
    //                                   borderRadius: const BorderRadius.all(
    //                                       Radius.circular(40))),
    //                             ),
    //                           ),
    //                         ),
    //                       );
    //                     })),
    //               ),
    //             ],
    //           ),
    //         )
    //       ])),
    //     ],

    // );
  }
}
