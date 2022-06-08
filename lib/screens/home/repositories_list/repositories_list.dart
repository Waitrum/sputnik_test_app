import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sputnik_test_app/screens/home/following_list/bloc/followinglist_bloc.dart';
import 'package:sputnik_test_app/screens/home/repositories_list/bloc/repositorieslist_bloc.dart';
import 'package:sputnik_test_app/services/constans.dart';

class RepositoriesList extends StatelessWidget {
  const RepositoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RepositorieslistBloc>(
      create: (context) =>
          RepositorieslistBloc()..add(RepositorieslistInitialEvent()),
      child: Builder(builder: (context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Repositories',
                    style: TextStyle(
                      fontSize: 34,
                      color: ProjectColors.primaryText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View all',
                      style: TextStyle(
                          fontSize: 15,
                          color: ProjectColors.primaryText,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: BlocBuilder<RepositorieslistBloc, RepositorieslistState>(
                builder: (context, state) {
                  if (state is RepositorieslistSuccessState) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: ((context, index) => const SizedBox(
                            width: 20,
                          )),
                      itemCount: state.repos.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: const Image(
                                        height: 100,
                                        image: AssetImage(
                                          'assets/js_avatar.png',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: ProjectColors.greyBackground,
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/star_icon.svg'),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              state.repos[index].stargazersCount
                                                  .toString(),
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: ProjectColors.yellow,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.repos[index].name,
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: ProjectColors.primaryText,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            state.repos[index].id.toString(),
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color:
                                                  ProjectColors.secondaryText,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: ProjectColors.primaryText,
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/fork_icon.svg'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              state.repos[index].forksCount
                                                  .toString(),
                                              overflow: TextOverflow.fade,
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }
                  return const Center(
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator.adaptive(
                        strokeWidth: 1.5,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
