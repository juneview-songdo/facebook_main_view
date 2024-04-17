import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../../main.dart';
import '../home/view.dart';
import '../on_demand/view.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class NewView extends StatefulWidget {
  NewView({super.key});

  @override
  State<NewView> createState() => StateChild();
}

class NewViewState extends State<NewView> with StateMother,SingleTickerProviderStateMixin  {
  final TrackingScrollController scrollController = TrackingScrollController();
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        bottom: false,
        child: DefaultTabController(
          length: 4,
          child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: SliverAppBar(
                      pinned: false,
                      backgroundColor: Colors.white,
                      title: Text(
                        'facebook',
                        style: const TextStyle(
                          color: Color(0xFF1777F2),
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1.2,
                        ),
                      ),
                      centerTitle: false,
                      floating: true,
                      actions: [
                        Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFe6eef5),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.search),
                            iconSize: 25,
                            color: Colors.black,
                            onPressed: () => print('Search'),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFe6eef5),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.message),
                            iconSize: 25,
                            color: Colors.black,
                            onPressed: () => print('Messenger'),
                          ),
                        )
                      ], systemOverlayStyle: SystemUiOverlayStyle.dark,
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        controller: controller,
                        labelColor: Color(0xFF1777F2),
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(icon: Icon(Icons.home, size: 25,)),
                          Tab(icon: Icon(Icons.ondemand_video,size: 25)),
                          Tab(icon: Icon(Icons.notifications,size: 25)),
                          Tab(icon: Icon(Icons.menu,size: 25)),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                controller: controller,
                children: [
                  HomeView(),
                  OnDemandView(),
                  Container().backgroundColor(Colors.red),
                  Container().backgroundColor(Colors.green),
                ],
              )
          ),
        ),
      ),
      floatingActionButton: FloatingActionButtonKit(),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

main() async {
  return buildApp(appHome: NewView());
}