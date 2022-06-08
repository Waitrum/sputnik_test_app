import 'package:flutter/material.dart';
import 'package:sputnik_test_app/screens/home/following_list/following_list.dart';
import 'package:sputnik_test_app/screens/home/github_search/github_search_screen.dart';
import 'package:sputnik_test_app/screens/home/repositories_list/repositories_list.dart';
import 'package:sputnik_test_app/services/constans.dart';
import 'package:sputnik_test_app/views/main_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cristian',
                      style: TextStyle(
                        fontSize: 34,
                        color: ProjectColors.primaryText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    MainButton(
                      onTap: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const GithubSearchScreen()));
                      }),
                      text: 'Follow on github',
                      iconPath: 'assets/plus_icon.svg',
                      height: 42,
                      width: 116,
                      fontSize: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Company - @hSchool',
                  style: TextStyle(
                    fontSize: 17,
                    color: ProjectColors.secondaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Email - mikevocalz@gmail.com',
                  style: TextStyle(
                    fontSize: 17,
                    color: ProjectColors.secondaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Bio - Front-End Dev w/ a touch of UI/UX',
                  style: TextStyle(
                    fontSize: 17,
                    color: ProjectColors.secondaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Divider(
                height: 20,
              ),
              const FollowingList(),
              const Divider(
                height: 20,
              ),
              const RepositoriesList(),
            ],
          ),
        ),
      ),
    );
  }
}
