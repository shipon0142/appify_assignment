import 'package:code_base/core/di/di_import_path.dart';
import 'package:code_base/features/community/data/req/create_comment_request_params.dart';
import 'package:code_base/features/community/presentation/manager/create_comment/create_comment_bloc.dart';
import 'package:code_base/features/community/presentation/manager/create_reaction/create_reaction_bloc.dart';
import 'package:code_base/features/community/presentation/manager/get_comments/get_comments_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBottomSheetWidget extends StatefulWidget {
  final int feedId;
  final int feedUserId;

  const CommentBottomSheetWidget({
    super.key,
    required this.feedId,
    required this.feedUserId,
  });

  @override
  State<CommentBottomSheetWidget> createState() =>
      _CommentBottomSheetWidgetState();
}

class _CommentBottomSheetWidgetState extends State<CommentBottomSheetWidget> {
  final TextEditingController _commentController = TextEditingController();
  var getCommentsBloc = injector<GetCommentsBloc>();

  @override
  void initState() {
    getCommentsBloc.add(GetComments(feedId: widget.feedId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(36),
          topLeft: Radius.circular(36),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  25,
                  23,
                  24,
                  33,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Comments',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BlocProvider.value(
                      value: getCommentsBloc,
                      child: BlocBuilder<GetCommentsBloc, GetCommentsState>(
                        builder: (context, state) {
                          if (state is GetCommentsSuccess) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.comments.length,
                              separatorBuilder: (context, index) => SizedBox(
                                height: 20,
                              ),
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(9999),
                                      child: Image.network(
                                        state.comments[index].user
                                                ?.profilePic ??
                                            '',
                                        height: 54,
                                        width: 54,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF0F2F5),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                            10,
                                            10,
                                            0,
                                            10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    state.comments[index].user
                                                            ?.fullName ??
                                                        '',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    state.comments[index]
                                                            .commentTxt ??
                                                        '',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.more_horiz,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Flexible(
                    child: SizedBox(
                      height:100,
                      child: TextFormField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          hintText: "Write a Comment",
                          contentPadding: EdgeInsets.fromLTRB(
                            13,
                            22,
                            0,
                            22,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.grey.shade50,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFE8E8E8),
                            ),
                          ),
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: InkWell(
                        onTap: () {
                          injector<CreateCommentBloc>().add(CreateComment(
                              payload: CreateCommentParams(
                                  feedId: widget.feedId,
                                  feedUserId: widget.feedUserId,
                                  commentTxt: _commentController.text,
                                  commentSource: 'COMMUNITY')));
                          Navigator.pop(context,true);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
