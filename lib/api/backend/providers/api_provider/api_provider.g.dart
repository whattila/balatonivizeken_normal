// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$balatoniVizekenApiHash() =>
    r'd226202633c1ffce197253c12600d05e3a713a30';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef BalatoniVizekenApiRef = AutoDisposeProviderRef<Api>;

/// See also [balatoniVizekenApi].
@ProviderFor(balatoniVizekenApi)
const balatoniVizekenApiProvider = BalatoniVizekenApiFamily();

/// See also [balatoniVizekenApi].
class BalatoniVizekenApiFamily extends Family<Api> {
  /// See also [balatoniVizekenApi].
  const BalatoniVizekenApiFamily();

  /// See also [balatoniVizekenApi].
  BalatoniVizekenApiProvider call({
    void Function(DioError, ErrorInterceptorHandler)? onError,
  }) {
    return BalatoniVizekenApiProvider(
      onError: onError,
    );
  }

  @override
  BalatoniVizekenApiProvider getProviderOverride(
    covariant BalatoniVizekenApiProvider provider,
  ) {
    return call(
      onError: provider.onError,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'balatoniVizekenApiProvider';
}

/// See also [balatoniVizekenApi].
class BalatoniVizekenApiProvider extends AutoDisposeProvider<Api> {
  /// See also [balatoniVizekenApi].
  BalatoniVizekenApiProvider({
    this.onError,
  }) : super.internal(
          (ref) => balatoniVizekenApi(
            ref,
            onError: onError,
          ),
          from: balatoniVizekenApiProvider,
          name: r'balatoniVizekenApiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$balatoniVizekenApiHash,
          dependencies: BalatoniVizekenApiFamily._dependencies,
          allTransitiveDependencies:
              BalatoniVizekenApiFamily._allTransitiveDependencies,
        );

  final void Function(DioError, ErrorInterceptorHandler)? onError;

  @override
  bool operator ==(Object other) {
    return other is BalatoniVizekenApiProvider && other.onError == onError;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, onError.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
