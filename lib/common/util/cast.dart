extension CastOrNullByObject on Object {
  T? castOrNull<T>() => this is T ? this as T? : null;
}

extension CastOrNullByDynamic on dynamic {
  T? castOrNull<T>() => this is T ? this as T? : null;
}
