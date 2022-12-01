import 'package:freezed_annotation/freezed_annotation.dart';

part 'observation_failure.freezed.dart';

@freezed
abstract class ObservationFailure with _$ObservationFailure {
  const factory ObservationFailure.unexpected() = _Unexpected;
  const factory ObservationFailure.insufficientPermission() = _InsufficientPermission;
  const factory ObservationFailure.unableToUpdate() = _UnableToUpdate;
}
