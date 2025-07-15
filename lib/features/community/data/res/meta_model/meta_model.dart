import 'package:code_base/features/community/domain/entity/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_model.freezed.dart';
part 'meta_model.g.dart';

@freezed
class MetaModel extends Meta with _$MetaModel {
  const factory MetaModel({
    int? views,
  }) = _MetaModel;

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);
}
