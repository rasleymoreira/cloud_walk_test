import 'package:dartz/dartz.dart';

extension EitherHelpers<L, R> on Either<L, R> {
  R? get unwrapRight {
    return toOption().toNullable();
  }

  L? get unwrapLeft {
    return swap().toOption().toNullable();
  }
}
