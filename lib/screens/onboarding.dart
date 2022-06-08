import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sputnik_test_app/screens/main_gate.dart';
import 'package:sputnik_test_app/services/constans.dart';
import 'package:sputnik_test_app/services/context_extentions.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 39),
              child: SvgPicture.asset(
                'assets/logo.svg',
                fit: BoxFit.contain,
                height: 85,
                width: 85,
              ),
            ),
            Flexible(
              child: Center(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    _OnboardingTab(
                      text: 'Фонд поддержки стартапов «Спутник»',
                      imagePath: 'assets/onboarding1.png',
                    ),
                    _OnboardingTab(
                      text:
                          'Мы помогаем сфокусироваться на главном — предпринимательстве',
                      imagePath: 'assets/onboarding2.png',
                    ),
                    _OnboardingTab(
                      text: 'Сделано ботаниками для ботаников',
                      imagePath: 'assets/onboarding3.png',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Center(
              child: SizedBox(
                width: context.width * 0.4,
                child: TabBar(
                  indicator: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  controller: _tabController,
                  tabs: List.generate(
                    3,
                    (index) => Tab(
                      key: ValueKey(index),
                      height: 30,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOutCubic,
                        decoration: BoxDecoration(
                          color: _tabController.index == index
                              ? Colors.white
                              : ProjectColors.numberBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                              color: _tabController.index == index
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  if (_tabController.index == 2) {
                    SharedPreferences.getInstance().then((value) {
                      value.setBool('onboarding', true);
                    });
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const MainGate()));
                    return;
                  }
                  _tabController.animateTo(_tabController.index + 1);
                },
                child: Container(
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: LinearGradient(
                      colors: ProjectColors.buttonGradient,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingTab extends StatelessWidget {
  final String text;
  final String imagePath;
  const _OnboardingTab({
    required this.text,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Image.asset(
                imagePath,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
