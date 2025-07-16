part of 'create_reaction_bloc.dart';

sealed class CreateReactionEvent extends Equatable {
  const CreateReactionEvent();
  @override
  List<Object?> get props => [];
}

class CreateReaction extends CreateReactionEvent {
  final CreateReactionParams payload;
  const CreateReaction({required this.payload});
}

