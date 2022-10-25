import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utilis/inputdecoration.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> tags = [
      "Accommodation",
      "Admission",
      "Studies",
      "Information",
      "Incident"
    ];

    String selectedTag = tags.first.toString();
    TextEditingController question = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          width: size.width * 0.85,
          height: size.height * 0.6,
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
                        height: 20,
                      ),
                      Text(
                        "Catagories",
                        style: GoogleFonts.nunito(
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
                        style: GoogleFonts.nunito(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        hint: Text(
                          "Select Categories",
                          style: GoogleFonts.nunito(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        dropdownColor: Colors.white,
                        value: selectedTag,
                        onChanged: (value) {
                          selectedTag = value!;
                          setState(() {});
                        },
                        items: tags.map((String tag) {
                          return DropdownMenuItem(
                            value: tag,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  tag,
                                  style: GoogleFonts.nunito(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
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
                        style: GoogleFonts.nunito(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          question.text = value;
                          setState(() {});
                        },
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        decoration: inputDecorationTextField.copyWith(
                          hintText: "What do you want to ask?",
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            if (question.text.isNotEmpty &&
                                selectedTag.isNotEmpty) {
                              print(selectedTag);
                              print(question);
                            } else {
                              print("We are empty");
                            }
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: const BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                )),
                            child: Center(
                              child: Text(
                                "Ask Now",
                                style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
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
}
