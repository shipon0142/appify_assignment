import 'package:auto_route/auto_route.dart';
import 'package:code_base/core/di/di_import_path.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/presentation/manager/login_bloc.dart';
import 'package:code_base/features/community/presentation/manager/community_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utility/constants/color_manager.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginBloc = injector<LoginBloc>();
    var commiunityBloc = injector<CommunityBloc>();
    commiunityBloc.add(GetFeeds(communityId: 2914, spaceId: 5883));

    return Scaffold(
      backgroundColor: ColorManager.kColorWhite,
      body: Text('Dashboard'),
    );
  }

}
