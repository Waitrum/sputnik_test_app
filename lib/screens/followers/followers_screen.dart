import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sputnik_test_app/screens/followers/bloc/followers_bloc.dart';
import 'package:sputnik_test_app/services/constans.dart';
import 'package:sputnik_test_app/services/context_extentions.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({Key? key}) : super(key: key);

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: ((context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            // toolbarHeight: 74,
            pinned: true,
            title: Text(
              'Followers',
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 34,
                color: ProjectColors.primaryText,
                fontWeight: FontWeight.w700,
              ),
            ),
            backgroundColor: ProjectColors.background,
          ),
          SliverAppBar(
            primary: false,
            forceElevated: true,
            toolbarHeight: 72,
            floating: true,
            centerTitle: true,
            title: Center(
              child: SizedBox(
                height: 45,
                child: TextField(
                  maxLengthEnforcement: MaxLengthEnforcement.none,
                  decoration: InputDecoration(
                    fillColor: ProjectColors.greyBackground,
                    filled: true,
                    hintText: 'Search...',
                    suffixIcon: SizedBox(
                      height: 13,
                      width: 13,
                      child: SvgPicture.asset(
                        'assets/filter_icon.svg',
                        height: 13,
                        width: 13,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: ProjectColors.secondaryText,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            backgroundColor: ProjectColors.background,
          ),
        ];
      }),
      body: BlocBuilder<FollowersBloc, FollowersState>(
        builder: (context, state) {
          if (state is FollowersSuccessState) {
            return ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: ((context, index) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: ProjectColors.greyBackground,
                        foregroundImage: NetworkImage(
                          state.followers[index].avatarUrl,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.followers[index].login,
                            style: TextStyle(
                              fontSize: 20,
                              color: ProjectColors.primaryText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            state.followers[index].id.toString(),
                            style: TextStyle(
                              fontSize: 17,
                              color: ProjectColors.secondaryText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: state.followers.length,
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
