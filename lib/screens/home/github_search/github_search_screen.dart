import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sputnik_test_app/screens/home/github_search/bloc/githubsearch_bloc.dart';
import 'package:sputnik_test_app/services/constans.dart';
import 'package:sputnik_test_app/views/main_button.dart';

class GithubSearchScreen extends StatefulWidget {
  const GithubSearchScreen({Key? key}) : super(key: key);

  @override
  State<GithubSearchScreen> createState() => _GithubSearchScreenState();
}

class _GithubSearchScreenState extends State<GithubSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ProjectColors.background,
        elevation: 0,
        iconTheme: IconThemeData(
          color: ProjectColors.icon,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Github social',
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 34,
                    color: ProjectColors.primaryText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Enter nickname on github',
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 17,
                    color: ProjectColors.secondaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: BlocProvider<GithubsearchBloc>(
                    create: (context) => GithubsearchBloc(),
                    child: Builder(builder: (context) {
                      var bloc = context.read<GithubsearchBloc>();
                      return BlocBuilder<GithubsearchBloc, GithubsearchState>(
                        builder: (context, state) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: ProjectColors.greyBackground,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nickname',
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: ProjectColors.secondaryText,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextField(
                                      controller: bloc.textEditingController,
                                      style: TextStyle(
                                        fontSize: 36,
                                        color: ProjectColors.primaryText,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Enter nickname',
                                        hintStyle: TextStyle(
                                          fontSize: 36,
                                          color: ProjectColors.secondaryText,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        fillColor: ProjectColors.greyBackground,
                                        filled: true,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (state is GithubsearchErrorState)
                                Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/warn_icon.svg',
                                      height: 100,
                                      width: 100,
                                    ),
                                    const SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      'User with this nickname not found!',
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: ProjectColors.error,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 25.0),
                                child: MainButton(
                                  text: 'Search',
                                  disable:
                                      bloc.textEditingController.text.isEmpty,
                                  onTap: () {
                                    bloc.add(GithubsearchCrashedEvent());
                                  },
                                ),
                              )
                            ],
                          );
                        },
                      );
                    }),
                  ),
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: ProjectColors.secondaryText,
                      ),
                      children: [
                        const TextSpan(text: 'By signing in, I agree with '),
                        TextSpan(
                          text: 'Terms of Use ',
                          style: TextStyle(
                            color: ProjectColors.primaryText,
                          ),
                        ),
                        const TextSpan(text: 'and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: ProjectColors.primaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
