import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '../widget.avatar_image/view.dart';
import '../widget.post_item/view.dart';
import '../widget.story_item/view.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => StateChild();
}

class HomeViewState extends State<HomeView> with StateMother {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[300],
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                elevation: 0.0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Color(0xFF1777F2),
                                child: CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.grey[200],
                                  backgroundImage: NetworkImage(
                                      "https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp"),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration.collapsed(
                                hintText: 'What\'s on your mind?',
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(height: 20.0, thickness: 0.5),
                      Container(
                        height: 40.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () => print('Live'),
                              icon: SvgPicture.asset(
                                'assets/view/facebook_main_view/video-image.svg',
                                width: 20,
                                colorFilter: ColorFilter.mode(
                                    Colors.red, BlendMode.colorBurn),
                              ),
                              label: Text('Live'),
                            ),
                            const VerticalDivider(
                              width: 8.0,
                            ),
                            ElevatedButton.icon(
                              onPressed: () => print('Photo'),
                              icon: const Icon(
                                Icons.photo_library,
                                color: Colors.lightGreen,
                                size: 20,
                              ),
                              label: Text('Photo'),
                            ),
                            const VerticalDivider(width: 8.0),
                            ElevatedButton.icon(
                              onPressed: () => print('Room'),
                              icon: const Icon(
                                Icons.video_call,
                                color: Colors.deepPurpleAccent,
                                size: 20,
                              ),
                              label: Text('Room'),
                            ),
                          ],
                        ),
                      ).paddingDirectional(bottom: 10),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0.0,
                child: Container(
                  height: 80.0,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 50,
                          width: 120,
                          child: OutlinedButton(
                            onPressed: () {
                              print('create Room');
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0)),
                              side: BorderSide(
                                  color: Colors.blue.shade100,
                                  width: 1.0), // HERE
                            ),
                            child: Row(
                              children: [
                                ShaderMask(
                                  shaderCallback: (bounds) {
                                    return RadialGradient(
                                      center: Alignment.topLeft,
                                      radius: 1,
                                      colors: [Colors.blue, Colors.pinkAccent],
                                      tileMode: TileMode.clamp,
                                    ).createShader(
                                      Rect.fromLTWH(0, 0, 100, 100),
                                    );
                                  },
                                  child: Icon(
                                    Icons.video_call,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 5.0),
                                Text('Create\nRoom'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            AvatarImageView(
                              profileAvatarImage:
                                  "https://i.insider.com/57bf2f13956abc1d008b45f9?width=957&format=jpeg",
                            ),
                            AvatarImageView(
                              profileAvatarImage:
                                  "https://vignette.wikia.nocookie.net/marvelcinematicuniverse/images/0/0a/Nick_Fury_Textless_AoU_Poster.jpg/revision/latest/top-crop/width/360/height/360?cb=20161119163035",
                            ),
                            AvatarImageView(
                              profileAvatarImage:
                              "https://vignette.wikia.nocookie.net/marvelcinematicuniverse/images/0/0a/Nick_Fury_Textless_AoU_Poster.jpg/revision/latest/top-crop/width/360/height/360?cb=20161119163035",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 280,
                child: Card(
                  elevation: 0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      StoryItemView(
                        StoryImage:
                            "https://images.unsplash.com/photo-1598240087583-2f610faf1eaf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1275&q=80",
                        userImage:
                            "https://images.unsplash.com/photo-1598211686290-a8ef209d87c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3334&q=80",
                        userName: "Tony",
                        first: true,
                      ),
                      StoryItemView(
                          StoryImage:
                              "https://images.unsplash.com/flagged/photo-1556746834-1cb5b8fabd54?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2252&q=80",
                          userImage:
                              "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=80",
                          userName: "Alex",
                          first: false),
                      StoryItemView(
                          StoryImage:
                              "https://images.unsplash.com/photo-1575997759258-91792eaaf87b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          userImage:
                              "https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2247&q=80",
                          userName: "Luis Villasmil",
                          first: false),
                      StoryItemView(
                          StoryImage:
                              "https://images.unsplash.com/photo-1505391847043-8b6e24dd6c28?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          userImage:
                              "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=80",
                          userName: "Nicolos Horn",
                          first: false),
                      StoryItemView(
                          StoryImage:
                              "https://images.unsplash.com/photo-1594463750939-ebb28c3f7f75?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          userImage:
                              "https://images.unsplash.com/photo-1528763380143-65b3ac89a3ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          userName: "Ben Parker",
                          first: false),
                      StoryItemView(
                          StoryImage:
                              "https://images.unsplash.com/photo-1505391847043-8b6e24dd6c28?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          userImage:
                              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          userName: "Minh Pham",
                          first: false),
                      StoryItemView(
                          StoryImage:
                              "https://images.unsplash.com/photo-1585128993280-9456c19c987d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1872&q=80",
                          userImage:
                              "https://images.unsplash.com/photo-1544724107-6d5c4caaff30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          userName: "Charles",
                          first: false),
                    ],
                  ),
                ),
              ),
              PostItemView(
                userImage:
                    'https://images.unsplash.com/photo-1544724107-6d5c4caaff30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                username: 'Charles',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '3hrs',
                imageUrl: null,
                likes: '32',
                comments: '10',
                shares: '9',
              ),
              PostItemView(
                userImage:
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                username: 'Minh Pham',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '7hrs',
                imageUrl:
                    "https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                likes: '432',
                comments: '120',
                shares: '90',
              ),
              PostItemView(
                userImage:
                    'https://images.unsplash.com/photo-1528763380143-65b3ac89a3ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                username: 'Ben Parker',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '8hrs',
                imageUrl: null,
                likes: '232',
                comments: '110',
                shares: '100',
              ),
              PostItemView(
                userImage:
                    'https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=80',
                username: 'Nicolos Horn',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '10hrs',
                imageUrl:
                    "https://images.unsplash.com/photo-1598225176697-e7fc9857917b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                likes: '22',
                comments: '130',
                shares: '30',
              ),
              PostItemView(
                userImage:
                    'https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2247&q=80',
                username: 'Luis Villasmil',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '12hrs',
                imageUrl:
                    "https://images.unsplash.com/photo-1558980664-3a031cf67ea8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                likes: '522',
                comments: '152',
                shares: '20',
              ),
              PostItemView(
                userImage:
                    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=80',
                username: 'Alex',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '2 days',
                imageUrl: null,
                likes: '123',
                comments: '12',
                shares: '1',
              ),
              PostItemView(
                userImage:
                    'https://images.unsplash.com/photo-1598211686290-a8ef209d87c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3334&q=80',
                username: 'Tony',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '2 days',
                imageUrl:
                    "https://images.unsplash.com/photo-1598259812920-0f409c9d3f14?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                likes: '125',
                comments: '13',
                shares: '4',
              ),
              PostItemView(
                userImage:
                    'https://images.unsplash.com/photo-1528763380143-65b3ac89a3ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                username: 'Charles',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '1 week',
                imageUrl: null,
                likes: '534',
                comments: '423',
                shares: '103',
              ),
              PostItemView(
                userImage:
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                username: 'Minh Pham',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '2 week',
                imageUrl:
                    "https://images.unsplash.com/photo-1558981033-f5e2ddd9c57e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                likes: '23',
                comments: '13',
                shares: '1',
              ),
              PostItemView(
                userImage:
                    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=80',
                username: 'Nicolos',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '2 week',
                imageUrl:
                    "https://images.unsplash.com/photo-1593642532781-03e79bf5bec2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                likes: '21',
                comments: '20',
                shares: '23',
              ),
            ],
          ),
        ));
  }
}

main() async {
  return buildApp(appHome: HomeView());
}
