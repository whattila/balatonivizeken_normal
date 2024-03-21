// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$balatoniVizekenApiHash() =>
    r'f1e57ec2efc04075c82c91698ba5604f08e37b78';

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

/// See also [balatoniVizekenApi].
@ProviderFor(balatoniVizekenApi)
const balatoniVizekenApiProvider = BalatoniVizekenApiFamily();

/// See also [balatoniVizekenApi].
class BalatoniVizekenApiFamily extends Family<Api> {
  /// See also [balatoniVizekenApi].
  const BalatoniVizekenApiFamily();

  /// See also [balatoniVizekenApi].
  BalatoniVizekenApiProvider call({
    void Function(DioException, ErrorInterceptorHandler)? onError,
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
    void Function(DioException, ErrorInterceptorHandler)? onError,
  }) : this._internal(
          (ref) => balatoniVizekenApi(
            ref as BalatoniVizekenApiRef,
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
          onError: onError,
        );

  BalatoniVizekenApiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.onError,
  }) : super.internal();

  final void Function(DioException, ErrorInterceptorHandler)? onError;

  @override
  Override overrideWith(
    Api Function(BalatoniVizekenApiRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BalatoniVizekenApiProvider._internal(
        (ref) => create(ref as BalatoniVizekenApiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        onError: onError,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Api> createElement() {
    return _BalatoniVizekenApiProviderElement(this);
  }

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

mixin BalatoniVizekenApiRef on AutoDisposeProviderRef<Api> {
  /// The parameter `onError` of this provider.
  void Function(DioException, ErrorInterceptorHandler)? get onError;
}

class _BalatoniVizekenApiProviderElement extends AutoDisposeProviderElement<Api>
    with BalatoniVizekenApiRef {
  _BalatoniVizekenApiProviderElement(super.provider);

  @override
  void Function(DioException, ErrorInterceptorHandler)? get onError =>
      (origin as BalatoniVizekenApiProvider).onError;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
