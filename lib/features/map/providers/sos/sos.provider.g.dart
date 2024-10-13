// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sos.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sosByIdHash() => r'3cef3b9f542b7dd521010322e3c92e81df8f60f3';

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

/// See also [sosById].
@ProviderFor(sosById)
const sosByIdProvider = SosByIdFamily();

/// See also [sosById].
class SosByIdFamily extends Family<AsyncValue<SosAlertDto>> {
  /// See also [sosById].
  const SosByIdFamily();

  /// See also [sosById].
  SosByIdProvider call({
    required String id,
  }) {
    return SosByIdProvider(
      id: id,
    );
  }

  @override
  SosByIdProvider getProviderOverride(
    covariant SosByIdProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'sosByIdProvider';
}

/// See also [sosById].
class SosByIdProvider extends AutoDisposeFutureProvider<SosAlertDto> {
  /// See also [sosById].
  SosByIdProvider({
    required String id,
  }) : this._internal(
          (ref) => sosById(
            ref as SosByIdRef,
            id: id,
          ),
          from: sosByIdProvider,
          name: r'sosByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sosByIdHash,
          dependencies: SosByIdFamily._dependencies,
          allTransitiveDependencies: SosByIdFamily._allTransitiveDependencies,
          id: id,
        );

  SosByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<SosAlertDto> Function(SosByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SosByIdProvider._internal(
        (ref) => create(ref as SosByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SosAlertDto> createElement() {
    return _SosByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SosByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SosByIdRef on AutoDisposeFutureProviderRef<SosAlertDto> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SosByIdProviderElement
    extends AutoDisposeFutureProviderElement<SosAlertDto> with SosByIdRef {
  _SosByIdProviderElement(super.provider);

  @override
  String get id => (origin as SosByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
