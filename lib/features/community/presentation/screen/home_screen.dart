import 'package:auto_route/auto_route.dart';
import 'package:code_base/core/di/di_import_path.dart';
import 'package:code_base/core/utility/date_utils.dart';
import 'package:code_base/features/community/presentation/manager/community/community_bloc.dart';
import 'package:code_base/features/community/presentation/screen/create_post_screen.dart';
import 'package:code_base/features/community/presentation/widgets/comment_bottom_sheet_widget.dart';
import 'package:code_base/features/community/utils/community_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_router.gr.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var commiunityBloc = injector<CommunityBloc>();

  @override
  void initState() {
    callCommunity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          callCommunity();
        },
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(color: Color(0xFF023D45)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 70, 0, 46),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          AutoRouter.of(context).push(FeedRoute());
                        },
                        child: Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Python Developer Community',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '# General',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  18,
                  16,
                  18,
                  0,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CreatePostScreen(),
                          ),
                        );
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              8,
                            ),
                          ),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.6),
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/icon.jpg',
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Write something here...',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.grey.withOpacity(0.9),
                                    ),
                                  ),
                                ],
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      4,
                                    ),
                                  ),
                                  color: Color(0xFF023D45),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    10,
                                    6,
                                    10,
                                    6,
                                  ),
                                  child: Text(
                                    'Post',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BlocProvider.value(
                      value: commiunityBloc,
                      child: BlocBuilder<CommunityBloc, CommunityState>(
                        builder: (context, state) {
                          if (state is CommunitySuccess) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.feeds.length,
                              separatorBuilder: (context, index) => SizedBox(
                                height: 18,
                              ),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.network(
                                              state.feeds[index].user
                                                      ?.profilePic ??
                                                  '',
                                              height: 40,
                                              width: 40,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state.feeds[index].user
                                                          ?.fullName ??
                                                      '',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  DateTimeUtils.timeAgo(state
                                                          .feeds[index]
                                                          .publishDate ??
                                                      ''),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: Colors.grey
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              40, 8, 0, 8),
                                          child: Icon(
                                            Icons.more_vert,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Divider(
                                      color: Colors.grey.withOpacity(0.4),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    RichText(
                                      textAlign: TextAlign.left,
                                      // 👈 aligns text to the left

                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          height: 1.6,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: state.feeds[index].feedTxt ??
                                                '',
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Image.network(
                                      state.feeds[index].pic ?? '',
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              8,
                                              8,
                                              8,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  children: [
                                                    if (CommunityUtils()
                                                        .getReactionTypes(state
                                                            .feeds[index]
                                                            .likeTypes)
                                                        .isEmpty)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 2),
                                                        child: Icon(
                                                          Icons.thumb_up,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    for (String reactionType
                                                        in CommunityUtils()
                                                            .getReactionTypes(
                                                                state
                                                                    .feeds[
                                                                        index]
                                                                    .likeTypes))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 2),
                                                        child: Icon(
                                                          CommunityUtils()
                                                              .getReactionIcon(
                                                                  reactionType),
                                                          color: (CommunityUtils()
                                                                      .getReactionIcon(
                                                                          reactionType) ==
                                                                  Icons
                                                                      .thumb_up)
                                                              ? Colors.blue
                                                              : Colors.yellow,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  CommunityUtils.getLikeCount(
                                                      false,
                                                      state.feeds[index]
                                                              .likeCount ??
                                                          0),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            bool result = await showModalBottomSheet(
                                              isScrollControlled: true,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return CommentBottomSheetWidget(
                                                  feedId: state.feeds[index].id,
                                                  feedUserId:
                                                  state.feeds[index].userId,
                                                );
                                              },
                                            );
                                            if(result){
                                              callCommunity();
                                            }
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              8,
                                              8,
                                              8,
                                              0,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.messenger_outline,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  '${state.feeds[index].commentCount} comments',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              0,
                                              8,
                                              8,
                                              8,
                                            ),
                                            child: Icon(
                                              Icons.thumb_up,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                           bool result = await showModalBottomSheet(
                                              isScrollControlled: true,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return CommentBottomSheetWidget(
                                                  feedId: state.feeds[index].id,
                                                  feedUserId:
                                                      state.feeds[index].userId,
                                                );
                                              },
                                            );
                                           if(result){
                                             callCommunity();
                                           }
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                              8,
                                              8,
                                              8,
                                              0,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.messenger_outline,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  'Comment',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void callCommunity() {
    commiunityBloc.add(GetFeeds(communityId: 2914, spaceId: 5883));
  }
}
