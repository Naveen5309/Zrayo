import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MyObserver extends ProviderObserver {
  @override
  void didAddProvider(
      ProviderBase<Object?> provider,
      Object? value,
      ProviderContainer container,
      ) {
    if (kDebugMode) {
      print('$provider was initialized with $value');
    }
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider,
      ProviderContainer container,
      ) {
    if (kDebugMode) {
      print('$provider Disposed');
    }
  }

  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container,) {
    if (kDebugMode) {
      print('$provider updated from $previousValue to $newValue');
    }
  }

  @override
  void providerDidFail(
      ProviderBase<Object?> provider,
      Object error,
      StackTrace stackTrace,
      ProviderContainer container,
      ) {
    if (kDebugMode) {
      print('$provider threw $error at $stackTrace');
    }
  }
}