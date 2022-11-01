import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constant/constant.dart';
import '../../../Models/getCommunitiesModel.dart';
import '../../../Utilis/inputdecoration.dart';

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
          IconButton(
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
                onChanged: (value) {
                  setState(() {});
                },
                style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                decoration: inputDecorationTextField.copyWith(
                  hintText: "Search",
                ),
              )
            : Row(
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
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
      ),
      backgroundColor: Colors.white,
      body: ListView(children: const []),
    );
  }
}
