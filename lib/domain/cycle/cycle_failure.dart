import 'package:freezed_annotation/freezed_annotation.dart';

part 'cycle_failure.freezed.dart';

@freezed
abstract class CycleFailure with _$CycleFailure {
  const factory CycleFailure.unexpected(String? erreur) = _Unexpected;
  const factory CycleFailure.idCycleUnfound() = _IdCycleUnfound;
  const factory CycleFailure.cycleUnfound() = _CycleUnfound;
  const factory CycleFailure.insufficientPermission() = _InsufficientPermission;
  const factory CycleFailure.unableToUpdate() = _UnableToUpdate;
}
