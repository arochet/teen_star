import 'package:freezed_annotation/freezed_annotation.dart';

part 'cycle_failure.freezed.dart';

@freezed
abstract class CycleFailure with _$CycleFailure {
  const factory CycleFailure.unexpected() = _Unexpected;
  const factory CycleFailure.insufficientPermission() = _InsufficientPermission;
  const factory CycleFailure.unableToUpdate() = _UnableToUpdate;
}
