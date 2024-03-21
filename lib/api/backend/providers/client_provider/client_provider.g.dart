// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$balatoniVizekenClientHash() =>
    r'57ce7e3706ec3b4ec2477f0816462518f8a858bb';

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

/// Provides [BalatoniVizekenClient] to allow API calls via.
///
/// Copied from [balatoniVizekenClient].
@ProviderFor(balatoniVizekenClient)
const balatoniVizekenClientProvider = BalatoniVizekenClientFamily();

/// Provides [BalatoniVizekenClient] to allow API calls via.
///
/// Copied from [balatoniVizekenClient].
class BalatoniVizekenClientFamily extends Family<BalatoniVizekenClient> {
  /// Provides [BalatoniVizekenClient] to allow API calls via.
  ///
  /// Copied from [balatoniVizekenClient].
  const BalatoniVizekenClientFamily();

  /// Provides [BalatoniVizekenClient] to allow API calls via.
  ///
  /// Copied from [balatoniVizekenClient].
  BalatoniVizekenClientProvider call({
    void Function(DioException, ErrorInterceptorHandler)? onError,
  }) {
    return BalatoniVizekenClientProvider(
      onError: onError,
    );
  }

  @override
  BalatoniVizekenClientProvider getProviderOverride(
    covariant BalatoniVizekenClientProvider provider,
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
  String? get name => r'balatoniVizekenClientProvider';
}

/// Provides [BalatoniVizekenClient] to allow API calls via.
///
/// Copied from [balatoniVizekenClient].
class BalatoniVizekenClientProvider
    extends AutoDisposeProvider<BalatoniVizekenClient> {
  /// Provides [BalatoniVizekenClient] to allow API calls via.
  ///
  /// Copied from [balatoniVizekenClient].
  BalatoniVizekenClientProvider({
    void Function(DioException, ErrorInterceptorHandler)? onError,
  }) : this._internal(
          (ref) => balatoniVizekenClient(
            ref as BalatoniVizekenClientRef,
            onError: onError,
          ),
          from: balatoniVizekenClientProvider,
          name: r'balatoniVizekenClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$balatoniVizekenClientHash,
          dependencies: BalatoniVizekenClientFamily._dependencies,
          allTransitiveDependencies:
              BalatoniVizekenClientFamily._allTransitiveDependencies,
          onError: onError,
        );

  BalatoniVizekenClientProvider._internal(
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
    BalatoniVizekenClient Function(BalatoniVizekenClientRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BalatoniVizekenClientProvider._internal(
        (ref) => create(ref as BalatoniVizekenClientRef),
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
  AutoDisposeProviderElement<BalatoniVizekenClient> createElement() {
    return _BalatoniVizekenClientProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BalatoniVizekenClientProvider && other.onError == onError;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, onError.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BalatoniVizekenClientRef
    on AutoDisposeProviderRef<BalatoniVizekenClient> {
  /// The parameter `onError` of this provider.
  void Function(DioException, ErrorInterceptorHandler)? get onError;
}

class _BalatoniVizekenClientProviderElement
    extends AutoDisposeProviderElement<BalatoniVizekenClient>
    with BalatoniVizekenClientRef {
  _BalatoniVizekenClientProviderElement(super.provider);

  @override
  void Function(DioException, ErrorInterceptorHandler)? get onError =>
      (origin as BalatoniVizekenClientProvider).onError;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
