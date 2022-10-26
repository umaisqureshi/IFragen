import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            preferredSize: Size(double.infinity, size.height * 0.35),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.15,
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
                            Container(
                              height: 60,
                              width: size.width * 0.78,
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
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Icon(
                                Icons.search,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TabBar(
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: Colors.greenAccent,
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
            Center(
              child: Text(
                "Trending",
                style: GoogleFonts.nunito(
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
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
