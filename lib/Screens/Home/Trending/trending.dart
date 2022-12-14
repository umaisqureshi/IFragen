import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Models/trendingIconModel.dart';
import '../../../Bloc/TrendingQuestionsBloc/trending_questions_bloc.dart';
import '../../../Widgets/postWidget.dart';
import '../../AddQuestion/addQuestion.dart';
import '../../AddQuestion/questionDetail.dart';
import '../Widgets/widgets.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  List<TrendingIconModel> icons = [
    TrendingIconModel(
        icon: "assets/education.png", onPress: () {}, title: "Education"),
    TrendingIconModel(icon: "assets/home.png", onPress: () {}, title: "Home"),
    TrendingIconModel(
        icon: "assets/information.png", onPress: () {}, title: "Info"),
    TrendingIconModel(icon: "assets/admin.png", onPress: () {}, title: "Admin"),
    TrendingIconModel(icon: "assets/alert.png", onPress: () {}, title: "Alert"),
    TrendingIconModel(icon: "assets/story.png", onPress: () {}, title: "Story"),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => TrendingQuestionsBloc(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 20,
          hoverColor: Theme.of(context).primaryColor,
          hoverElevation: 50,
          shape: const StadiumBorder(),
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => const AddQuestion())));
          },
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
                  child: Text(
                    "Trending topics",
                    style: GoogleFonts.roboto(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                    height: size.height * 0.12,
                    width: size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: icons.length,
                        itemBuilder: ((context, index) {
                          return trendingScrollWidget(context, icons[index]);
                        }))),
              ],
            ),
            BlocBuilder<TrendingQuestionsBloc, TrendingQuestionsState>(
              builder: (context, state) {
                if (state is TrendingQuestionsLoaded) {
                  return ListView.builder(
                      key: const PageStorageKey<String>("page"),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) =>
                                    const QuestionDetailedPage(
                                        name: "", question: ""))));
                          },
                          child: const PostWidget(
                            email: "umaisqureshi26@gmail.com",
                            name: "Umais Qureshi",
                            image: "assets/splashicon.png",
                            likes: 67,
                            comments: 324,
                            dislike: 12,
                          ),
                        );
                      }));
                }

                //WE WILL WORK ON IT AFTER API'S ARE IMPLEMENTED
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => const QuestionDetailedPage(
                                  name: "", question: ""))));
                        },
                        child: const PostWidget(
                          email: "umaisqureshi26@gmail.com",
                          name: "Umais Qureshi",
                          image: "assets/splashicon.png",
                          likes: 110,
                          comments: 675,
                          dislike: 34,
                        ),
                      );
                    }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
