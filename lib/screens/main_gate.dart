import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sputnik_test_app/screens/followers/bloc/followers_bloc.dart';
import 'package:sputnik_test_app/screens/followers/followers_screen.dart';
import 'package:sputnik_test_app/screens/home/home_screen.dart';
import 'package:sputnik_test_app/screens/profile/profile_screen.dart';
import 'package:sputnik_test_app/services/constans.dart';

class MainGate extends StatefulWidget {
  const MainGate({Key? key}) : super(key: key);

  @override
  State<MainGate> createState() => _MainGateState();
}

class _MainGateState extends State<MainGate>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomeScreen(),
      BlocProvider(
        create: (context) => FollowersBloc()..add(FollowersInitializedEvent()),
        child: const FollowersScreen(),
      ),
      const Center(
        child: Text('Chat'),
      ),
      const ProfileScreen(),
    ];
    return Scaffold(
        backgroundColor: ProjectColors.background,
        body: pages[_tabController.index],
        bottomNavigationBar: TabBar(
          unselectedLabelColor: ProjectColors.unselectedNavBarItem,
          labelColor: ProjectColors.selectedNavBarItem,
          indicatorColor: Colors.transparent,
          controller: _tabController,
          tabs: [
            Tab(
              icon: SvgPicture.asset(
                'assets/home_icon.svg',
                color: _tabController.index == 0
                    ? ProjectColors.selectedNavBarItem
                    : ProjectColors.unselectedNavBarItem,
              ),
              text: 'Home',
            ),
            Tab(
              icon: SvgPicture.asset(
                'assets/user_icon.svg',
                color: _tabController.index == 1
                    ? ProjectColors.selectedNavBarItem
                    : ProjectColors.unselectedNavBarItem,
              ),
              text: 'Followers',
            ),
            Tab(
              icon: SvgPicture.asset(
                'assets/chat_icon.svg',
                color: _tabController.index == 2
                    ? ProjectColors.selectedNavBarItem
                    : ProjectColors.unselectedNavBarItem,
              ),
              text: 'Chat',
            ),
            Tab(
              icon: SvgPicture.asset(
                'assets/profile_icon.svg',
                color: _tabController.index == 3
                    ? ProjectColors.selectedNavBarItem
                    : ProjectColors.unselectedNavBarItem,
              ),
              text: 'Profile',
            ),
          ],
        ));
  }
}
