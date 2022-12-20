import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileEditTileWidget extends StatefulWidget {
  final String title, value;

  const ProfileEditTileWidget({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileEditTileWidget> createState() => _ProfileEditTileWidgetState();
}

class _ProfileEditTileWidgetState extends State<ProfileEditTileWidget> {
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            widget.title,
            style: GoogleFonts.roboto(
                color: Theme.of(context).primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: 5),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              key: widget.key,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.4,
                    blurRadius: 7,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    isEdit
                        ? TextField(
                            textAlign: TextAlign.justify,
                            showCursor: true,
                            cursorColor: Theme.of(context).primaryColor,
                            onChanged: (value) {},
                            style: GoogleFonts.roboto(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10.0),
                              focusColor: Colors.white,
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
                              hintText: widget.value,
                              hintStyle: GoogleFonts.roboto(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                          )
                        : Text(
                            widget.value,
                            style: GoogleFonts.roboto(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                    Positioned(
                      right: -25,
                      bottom: -7,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isEdit = !isEdit;
                            });
                          },
                          child: Container(
                            key: widget.key,
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              isEdit ? Icons.check : Icons.edit,
                              color: Theme.of(context).primaryColor,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
