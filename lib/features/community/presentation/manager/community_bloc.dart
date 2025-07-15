import 'package:bloc/bloc.dart';
import 'package:code_base/features/auth/data/req/login_request_params.dart';
import 'package:code_base/features/auth/domain/entity/login.dart';
import 'package:code_base/features/community/domain/entity/feed.dart';
import 'package:equatable/equatable.dart';

import '../../domain/use_cases/community_usecase.dart';

part 'community_event.dart';

part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  final CommunityUseCase useCase;

  CommunityBloc({required this.useCase}) : super(CommunityInitial()) {
    on<GetFeeds>(_onGetFeeds);
  }

  Future<void> _onGetFeeds(GetFeeds event, Emitter<CommunityState> emit) async {
    emit(CommunityLoading());

    final result = await useCase(
      communityId: event.communityId,
      spaceId: event.spaceId,
    );
    result.fold(
      (failure) => emit(CommunityError(
        errorCode: failure.code,
        errorStatus: failure.status,
        errorMessage: failure.message,
      )),
      (response) {
        emit(CommunitySuccess(feeds: response));
      },
    );
  }
}
