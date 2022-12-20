import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Screens/Home/Community/communityDetailedPage.dart';
import '../../../Constant/constant.dart';
import '../../../Models/getCommunitiesModel.dart';
import '../../../Utilis/inputdecoration.dart';
import '../../../Widgets/postWidget.dart';
import '../../AddQuestion/questionDetail.dart';

class CommunityMainScreen extends StatefulWidget {
  final Community communitiesData;
  const CommunityMainScreen({super.key, required this.communitiesData});

  @override
  State<CommunityMainScreen> createState() => _CommunityMainScreenState();
}

class _CommunityMainScreenState extends State<CommunityMainScreen> {
  bool showSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          showSearch
              ? Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showSearch = !showSearch;
                        });
                      },
                      child: Text(
                        "Go",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              : IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () => setState(() {
                    showSearch = !showSearch;
                  }),
                ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: showSearch
            ? TextField(
                cursorColor: Colors.white,
                onChanged: (value) {
                  setState(() {});
                },
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                decoration: inputDecorationTextField.copyWith(
                  hintText: "Search",
                ),
              )
            : GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => CommunityDetailedPage(
                            communityDetail: widget.communitiesData,
                          ))));
                },
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                widget.communitiesData.picture.isEmpty
                                    ? "https://media.istockphoto.com/vectors/people-family-together-human-unity-chat-bubble-vector-icon-vector-id1198036466?k=20&m=1198036466&s=612x612&w=0&h=QSpwvOA8_Gwkr8CYqDIvNGhTBurzIYjAkE-dfzlIOO8="
                                    : IMAGE_END_POINT +
                                        widget.communitiesData.picture,
                              ),
                              fit: BoxFit.cover),
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.communitiesData.name,
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          key: const PageStorageKey<String>("page"),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) =>
                        const QuestionDetailedPage(name: "", question: ""))));
              },
              child: const PostWidget(
                email: "umaisqureshi26@gmail.com",
                name: "Umais Qureshi",
                image: "assets/splashicon.png",
                likes: 24,
                comments: 234,
                dislike: 45,
              ),
            );
          })),
    );
  }
}
