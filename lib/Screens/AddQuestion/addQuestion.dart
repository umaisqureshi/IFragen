import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Bloc/InternetBloc/internet_bloc_bloc.dart';
import '../../Bloc/QuestionPostBloc/question_post_bloc.dart';
import '../../Utilis/inputdecoration.dart';
import '../../Widgets/noWifiWidget.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  List<String> tags = [
    "Accommodation",
    "Education",
    "Admin",
    "Information",
    "Alert",
    "Story"
  ];

  String selectedTag = "Accommodation";
  TextEditingController question = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuestionPostBloc(),
        ),
        BlocProvider(
          create: (context) => InternetBloc(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          //   backgroundColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.white,
          body: BlocBuilder<InternetBloc, InternetBlocState>(
              builder: (context, state) {
            if (state is InternetNotConnected) {
              return NoWifiWidget(
                msg: state.msg,
                color: Colors.white,
              );
            }

            return BlocConsumer<QuestionPostBloc, QuestionPostState>(
              listener: (context, state) {
                if (state is QuestionPosted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Question Successful Posted")));
                }
              },
              builder: ((context, state) {
                if (state is QuestionErrorState) {
                  return Text(state.error);
                } else {
                  return Center(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        width: size.width * 0.85,
                        height: size.height * 0.7,
                        color: Colors.transparent,
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "Catagories",
                                      style: GoogleFonts.roboto(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    DropdownButton(
                                      isExpanded: true,
                                      borderRadius: BorderRadius.circular(20),
                                      elevation: 4,
                                      style: GoogleFonts.roboto(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      hint: Text(
                                        "Select Categories",
                                        style: GoogleFonts.roboto(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      dropdownColor: Colors.white,
                                      value: selectedTag,
                                      onChanged: (value) {
                                        selectedTag = value!;
                                        setState(() {});
                                      },
                                      onTap: () => setState(() {}),
                                      items: tags.map((String tag) {
                                        return DropdownMenuItem(
                                          value: tag,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                tag,
                                                style: GoogleFonts.roboto(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Question",
                                      style: GoogleFonts.roboto(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      maxLines: 8,
                                      onChanged: (value) {
                                        question.text = value;
                                        setState(() {});
                                      },
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      decoration:
                                          inputDecorationTextField.copyWith(
                                        hintText: "What do you want to ask?",
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.06,
                                    ),
                                    Center(
                                      child: GestureDetector(
                                        onTap: () async {
                                          if (question.text.isNotEmpty &&
                                              selectedTag.isNotEmpty) {
                                            BlocProvider.of<QuestionPostBloc>(
                                                    context)
                                                .add(QuestionPost(selectedTag,
                                                    question.text));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 80,
                                                        horizontal: 40),
                                                    backgroundColor:
                                                        Colors.white,
                                                    shape:
                                                        const StadiumBorder(),
                                                    elevation: 30,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    content: Text(
                                                      "Please Filled All Fields",
                                                      style: GoogleFonts.roboto(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )));
                                          }
                                        },
                                        child: Card(
                                          elevation: 4,
                                          shape: const StadiumBorder(),
                                          child: Container(
                                            height: 60,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(30),
                                                )),
                                            child: Center(
                                              child: Text(
                                                "Ask Now",
                                                style: GoogleFonts.roboto(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                  );
                }
              }),
            );
          }),
        ),
      ),
    );
  }
}
