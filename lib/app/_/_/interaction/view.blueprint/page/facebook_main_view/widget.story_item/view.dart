import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class StoryItemView extends StatefulWidget {
  StoryItemView({
    super.key,
    required this.StoryImage,
    required this.userImage,
    required this.userName,
    this.first = false,
  });

  final String StoryImage;
  final String userImage;
  final String userName;
  final bool first;

  @override
  State<StoryItemView> createState() => StateChild();
}

class StoryItemViewState extends State<StoryItemView> with StateMother {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
      child: AspectRatio(
        aspectRatio: 1.6 / 2.6,
        child: Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(widget.first
                    ? "https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp"
                    : widget.StoryImage),
                fit: BoxFit.cover),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.1),
                ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                widget.first
                    ? Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Color(0xFF1777F2),
                        ),
                      )
                    : Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                            image: DecorationImage(
                                image: NetworkImage(widget.userImage),
                                fit: BoxFit.cover)),
                      ),
                Text(
                  widget.userName,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

main() async {
  return buildApp(
      appHome: StoryItemView(
    StoryImage:
        "https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp",
    userImage:
        "https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp",
    userName: "User Name",
  ).center());
}
