import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Bloc/TrendingQuestionsBloc/trending_questions_bloc.dart';
import '../../../Widgets/widgets.dart';
import '../Widgets/widgets.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => TrendingQuestionsBloc(),
      child: ListView(
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
          BlocBuilder<TrendingQuestionsBloc, TrendingQuestionsState>(
            builder: (context, state) {
              // if (state is TrendingQuestionsLoading) {
              //   return Center(
              //     child: CircularProgressIndicator(
              //       color: Theme.of(context).primaryColor,
              //       strokeWidth: 4,
              //     ),
              //   );
              // }
              if (state is TrendingQuestionsLoaded) {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return const PostWidget(
                        email: "umaisqureshi26@gmail.com",
                        name: "Umais Qureshi",
                        image: "assets/splashicon.png",
                      );
                    }));
              }
              // return Center(
              //   child: Text(
              //     "Trending Posts",
              //     style: GoogleFonts.nunito(
              //         color: Theme.of(context).primaryColor,
              //         fontSize: 18,
              //         fontWeight: FontWeight.bold),
              //   ),
              // );

//WE WILL WORK ON IT AFTER API'S ARE IMPLEMENTED
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return const PostWidget(
                      email: "umaisqureshi26@gmail.com",
                      name: "Umais Qureshi",
                      image: "assets/splashicon.png",
                    );
                  }));
            },
          ),
        ],
      ),
    );
  }
}
