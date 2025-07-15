import 'package:code_base/features/community/domain/entity/file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_model.freezed.dart';
part 'file_model.g.dart';

@freezed
class FileModel extends File with _$FileModel {
  const factory FileModel({
    String? fileLoc,
    String? originalName,
    String? type,
  }) = _FileModel;

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);
}