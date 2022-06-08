import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sputnik_test_app/services/constans.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/settings_icon.svg'),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(14),
                      primary: ProjectColors.greyBackground,
                      onPrimary: ProjectColors.icon,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/notification_icon.svg'),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(14),
                      primary: ProjectColors.greyBackground,
                      onPrimary: ProjectColors.icon,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const CircleAvatar(
                radius: 185 / 2,
                backgroundImage: AssetImage('assets/tanjir-ahmed.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Cristian Downey',
                style: TextStyle(
                  fontSize: 34,
                  color: ProjectColors.primaryText,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '7896619',
                style: TextStyle(
                  fontSize: 17,
                  color: ProjectColors.secondaryText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const _ProfileCard(
                text: 'My following',
                path: 'assets/love_icon.svg',
              ),
              const SizedBox(
                height: 10,
              ),
              const _ProfileCard(
                text: 'My followers',
                path: 'assets/love_icon.svg',
              ),
              const SizedBox(
                height: 18,
              ),
              const _ProfileCard(
                text: 'My badges',
                path: 'assets/medal_icon.svg',
              ),
              const SizedBox(
                height: 18,
              ),
              const _ProfileCard(
                text: 'My organizatios',
                path: 'assets/dollar_icon.svg',
              ),
              const SizedBox(
                height: 38,
              ),
              Container(
                height: 58,
                decoration: BoxDecoration(
                  color: ProjectColors.primaryText,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SvgPicture.asset('assets/arrow_right_icon.svg'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final String path;
  final String text;
  const _ProfileCard({
    Key? key,
    required this.path,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: ProjectColors.background,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: ProjectColors.shadow.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, 10))
        ],
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              SvgPicture.asset(path),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  color: ProjectColors.primaryText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
