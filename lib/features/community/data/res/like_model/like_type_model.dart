import 'package:code_base/features/community/domain/entity/feed.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_type_model.freezed.dart';
part 'like_type_model.g.dart';

@freezed
class LikeTypeModel extends LikeType with _$LikeTypeModel {
  const factory LikeTypeModel({
    @JsonKey(name: 'reaction_type') @Default('') String reactionType,
  }) = _LikeTypeModel;

  factory LikeTypeModel.fromJson(Map<String, dynamic> json) =>
      _$LikeTypeModelFromJson(json);
}