import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sputnik_test_app/screens/home/following_list/bloc/followinglist_bloc.dart';
import 'package:sputnik_test_app/services/constans.dart';

class FollowingList extends StatelessWidget {
  const FollowingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FollowinglistBloc>(
      create: (context) =>
          FollowinglistBloc()..add(FollowinglistInitialEvent()),
      child: Builder(builder: (context) {
        final bloc = context.read<FollowinglistBloc>();
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Following you',
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
              height: 180,
              child: BlocBuilder<FollowinglistBloc, FollowinglistState>(
                builder: (context, state) {
                  if (state is FollowinglistSuccessState) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: ((context, index) => const SizedBox(
                            width: 20,
                          )),
                      itemCount: state.followings.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: ProjectColors.greyBackground,
                              foregroundImage: NetworkImage(
                                state.followings[index].avatarUrl,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              state.followings[index].login,
                              style: TextStyle(
                                fontSize: 17,
                                color: ProjectColors.primaryText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              state.followings[index].id.toString(),
                              style: TextStyle(
                                fontSize: 10,
                                color: ProjectColors.secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
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
