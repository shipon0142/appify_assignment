part of 'create_reaction_bloc.dart';

sealed class CreateReactionState extends Equatable {
  const CreateReactionState();

  @override
  List<Object> get props => [];
}

class CreateReactionInitial extends CreateReactionState {}

class CreateReactionLoading extends CreateReactionState {}

class CreateReactionError extends CreateReactionState {
  final int errorCode;
  final String errorStatus;
  final String errorMessage;

  const CreateReactionError({
    required this.errorStatus,
    required this.errorCode,
    required this.errorMessage,
  });
}

class CreateReactionSuccess extends CreateReactionState {
  final dynamic response;
  const CreateReactionSuccess({required this.response});
}
