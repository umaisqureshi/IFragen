import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Screens/Drawer/drawer.dart';

import '../../Widgets/widgets.dart';
import '../AddQuestion/addQuestion.dart';
import 'Trending/trending.dart';
import 'Widgets/widgets.dart';

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
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).accentColor,
            elevation: 20,
            hoverColor: Theme.of(context).primaryColor,
            hoverElevation: 50,
            shape: const StadiumBorder(),
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => AddQuestion())));
            },
          ),
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, size.height * 0.18),
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
                            vertical: 6.0, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: size.height * 0.1,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: size.width * 0.6,
                              child: TextField(
                                onChanged: (value) {},
                                style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1.0),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 5.0),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1.0),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  hintText: "Search",
                                  hintStyle: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TabBar(
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: Theme.of(context).accentColor,
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
          body: TabBarView(controller: _tabController, children: [
            ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        "Trending topics",
                        style: GoogleFonts.nunito(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                        height: size.height * 0.1,
                        width: size.width,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: ((context, index) {
                              return trendingScrollWidget(context);
                            }))),
                  ],
                ),
                const TrendingScreen(),
              ],
            ),
            Center(
              child: Text(
                "Community",
                style: GoogleFonts.nunito(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ])),
    );
  }
}
