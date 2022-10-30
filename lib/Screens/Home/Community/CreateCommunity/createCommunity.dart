import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifragen/Models/createCommunityModel.dart';
import 'package:ifragen/Repo/allCommunityRepo.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Bloc/CommunityBloc/community_bloc.dart';
import '../../../../Utilis/inputdecoration.dart';

class CreateCommunityScreen extends StatefulWidget {
  const CreateCommunityScreen({super.key});

  @override
  State<CreateCommunityScreen> createState() => _CreateCommunityScreen();
}

class _CreateCommunityScreen extends State<CreateCommunityScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  String? isPublic = "Private";
  final ImagePicker _picker = ImagePicker();
  File? image;

  Future getImage() async {
    var img = await _picker.pickImage(source: ImageSource.gallery);
    if (img == null) return;
    File? imgs = File(img.path);
    setState(() {
      image = imgs;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) =>
          CommunityBloc(RepositoryProvider.of<CommunityRepo>(context)),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: BlocConsumer<CommunityBloc, CommunityState>(
          builder: (context, state) {
            // if (state is CommunityInitial) {
            //   return Center(
            //     child: CircularProgressIndicator(
            //       color: Theme.of(context).primaryColor,
            //       strokeWidth: 2,
            //     ),
            //   );
            // }

            return Center(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.85,
                color: Colors.transparent,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Community",
                              style: GoogleFonts.nunito(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // ignore: prefer_const_constructors
                          Center(
                            child: Column(
                              children: [
                                Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Theme.of(context).primaryColor),
                                    child: image == null
                                        ? IconButton(
                                            icon: const Icon(
                                              Icons.camera_alt_sharp,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            onPressed: getImage,
                                          )
                                        : CircleAvatar(
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            backgroundImage: FileImage(image!),
                                          )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Upload Image",
                                  style: GoogleFonts.quicksand(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Name",
                            style: GoogleFonts.nunito(
                                color: Theme.of(context).primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            onChanged: (value) {
                              name.text = value;
                              setState(() {});
                            },
                            style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            decoration: inputDecorationTextField.copyWith(
                              hintText: "Community name",
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Description",
                            style: GoogleFonts.nunito(
                                color: Theme.of(context).primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            maxLines: 5,
                            onChanged: (value) {
                              description.text = value;
                              setState(() {});
                            },
                            style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            decoration: inputDecorationTextField.copyWith(
                              hintText: "Description",
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          RadioListTile(
                            title: Text(
                              "Private",
                              style: GoogleFonts.nunito(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            value: "Private",
                            activeColor: Theme.of(context).primaryColor,
                            selectedTileColor: Theme.of(context).primaryColor,
                            groupValue: isPublic,
                            onChanged: (value) {
                              setState(() {
                                isPublic = value.toString();
                              });
                            },
                          ),

                          RadioListTile(
                            title: Text(
                              "Public",
                              style: GoogleFonts.nunito(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            value: "Public",
                            groupValue: isPublic,
                            activeColor: Theme.of(context).primaryColor,
                            selectedTileColor: Theme.of(context).primaryColor,
                            onChanged: (value) {
                              setState(() {
                                isPublic = value.toString();
                              });
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),

                          Center(
                            child: GestureDetector(
                              onTap: () async {
                                BlocProvider.of<CommunityBloc>(context).add(
                                    CreateCommunityEvent(
                                        description: description.text,
                                        isPublic:
                                            isPublic == "Public" ? true : false,
                                        name: name.text,
                                        picture: image!.path));
                              },
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    )),
                                child: Center(
                                  child: Text(
                                    "CREATE",
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is CommunityError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin:
                      const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: const StadiumBorder(),
                  elevation: 30,
                  padding: const EdgeInsets.all(20),
                  content: Text(
                    state.error,
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  )));
            }

            if (state is CommunityCreated) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin:
                      const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: const StadiumBorder(),
                  elevation: 30,
                  padding: const EdgeInsets.all(20),
                  content: Text(
                    "Successfully Created",
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  )));
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}
