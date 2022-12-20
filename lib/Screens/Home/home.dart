import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Screens/Profile/myprofile.dart';

import '../../Helper/helper.dart';
import 'Community/community.dart';
import 'Trending/trending.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height * 0.16),
          child: Column(
            children: [
              Container(
                height: size.height * 0.18,
                width: size.width,
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          GestureDetector(
                            onTap: () {
                              HelperClass.saveUserLoggedInStatus(false);
                            },
                            child: Card(
                              elevation: 10,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: size.width * 0.6,
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
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 10.0),
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
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => const MyProfile())));
                            },
                            child: Card(
                              elevation: 10,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TabBar(
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: Theme.of(context).colorScheme.secondary,
                        indicatorWeight: 3,
                        tabs: const [
                          Tab(
                            text: "Trending",
                          ),
                          Tab(
                            text: "Community",
                          ),
                        ]),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: _tabController,
          children: const [
            TrendingScreen(),
            CommunityScreen(),
          ],
        ),
      ),
    );
  }
}
