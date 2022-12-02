import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import 'errors.dart';
import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  bool isValid() => value.isRight();

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    //id = identity -> same as (r) => r
    return value.fold((l) => throw UnexpectedValueError(l), id);
  }

  @override
  String toString() => 'Value(value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

class UniqueId extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;
  factory UniqueId() {
    return UniqueId._(right(DateTime.now().microsecondsSinceEpoch));
  }
  factory UniqueId.fromUniqueInt(int uniqueId) {
    return UniqueId._(right(uniqueId));
  }
  const UniqueId._(this.value);
}
