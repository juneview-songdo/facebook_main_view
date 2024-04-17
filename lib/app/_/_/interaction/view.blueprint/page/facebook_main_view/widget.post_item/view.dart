import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '../widget.avatar_image/view.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class PostItemView extends StatefulWidget {
  PostItemView({
    super.key,
    required this.userImage,
    required this.username,
    required this.caption,
    required this.timeAgo,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });

  final String userImage, username, caption, timeAgo;
  final String? imageUrl;
  final String likes, comments, shares;

  @override
  State<PostItemView> createState() => StateChild();
}

class PostItemViewState extends State<PostItemView> with StateMother {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 0.0,
      ),
      elevation: 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      AvatarImageView(
                        profileAvatarImage: widget.userImage,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.username,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${widget.timeAgo} • ',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12.0,
                                  ),
                                ),
                                Icon(
                                  Icons.public,
                                  color: Colors.grey[600],
                                  size: 12.0,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_horiz),
                        onPressed: () => print('More'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Text(widget.caption),
                  widget.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 6.0),
                ],
              ),
            ),
            widget.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Image.network(widget.imageUrl!),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF1777F2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.thumb_up,
                          size: 10.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Expanded(
                        child: Text(
                          widget.likes,
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Text(
                        '${widget.comments} Comments',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '${widget.shares} Shares',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            print('Like');
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            height: 25.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/view/facebook_main_view/thumb-up-outline.svg',
                                  width: 20,
                                  colorFilter: ColorFilter.mode(
                                    Colors.grey.shade600,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                Text('Like'),
                              ],
                            ),
                          ),
                        ),
                      ).expanded(),
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            print('Comment');
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            height: 25.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/view/facebook_main_view/message-circle.svg',
                                  width: 20,
                                  colorFilter: ColorFilter.mode(
                                    Colors.grey.shade600,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                Text('Comment'),
                              ],
                            ),
                          ),
                        ),
                      ).expanded(),
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            print('Share');
                          },
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            height: 25.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/view/facebook_main_view/share-outline.svg',
                                  width: 20,
                                  colorFilter: ColorFilter.mode(
                                    Colors.grey.shade600,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                Text('Share'),
                              ],
                            ),
                          ),
                        ),
                      ).expanded(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

main() async {
  return buildApp(
      appHome: PostItemView(
    userImage:
        "https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp",
    username: "User Name",
    caption: "Caption",
    timeAgo: "2 hours ago",
    imageUrl:
        "https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp",
    likes: "100",
    comments: "20",
    shares: "10",
  ).center());
}
