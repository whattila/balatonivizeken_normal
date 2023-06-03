// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boat.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$boatByIdHash() => r'95e1b726872324f3b44839977cedbc32c04a9d90';

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

typedef BoatByIdRef = AutoDisposeFutureProviderRef<BoatDto>;

/// See also [boatById].
@ProviderFor(boatById)
const boatByIdProvider = BoatByIdFamily();

/// See also [boatById].
class BoatByIdFamily extends Family<AsyncValue<BoatDto>> {
  /// See also [boatById].
  const BoatByIdFamily();

  /// See also [boatById].
  BoatByIdProvider call({
    required String id,
  }) {
    return BoatByIdProvider(
      id: id,
    );
  }

  @override
  BoatByIdProvider getProviderOverride(
    covariant BoatByIdProvider provider,
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
  String? get name => r'boatByIdProvider';
}

/// See also [boatById].
class BoatByIdProvider extends AutoDisposeFutureProvider<BoatDto> {
  /// See also [boatById].
  BoatByIdProvider({
    required this.id,
  }) : super.internal(
          (ref) => boatById(
            ref,
            id: id,
          ),
          from: boatByIdProvider,
          name: r'boatByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$boatByIdHash,
          dependencies: BoatByIdFamily._dependencies,
          allTransitiveDependencies: BoatByIdFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is BoatByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$boatByUserIdHash() => r'914a73fa62ac94270ce628c54cef364b0e906142';
typedef BoatByUserIdRef = AutoDisposeFutureProviderRef<BoatDto>;

/// See also [boatByUserId].
@ProviderFor(boatByUserId)
const boatByUserIdProvider = BoatByUserIdFamily();

/// See also [boatByUserId].
class BoatByUserIdFamily extends Family<AsyncValue<BoatDto>> {
  /// See also [boatByUserId].
  const BoatByUserIdFamily();

  /// See also [boatByUserId].
  BoatByUserIdProvider call({
    required String id,
  }) {
    return BoatByUserIdProvider(
      id: id,
    );
  }

  @override
  BoatByUserIdProvider getProviderOverride(
    covariant BoatByUserIdProvider provider,
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
  String? get name => r'boatByUserIdProvider';
}

/// See also [boatByUserId].
class BoatByUserIdProvider extends AutoDisposeFutureProvider<BoatDto> {
  /// See also [boatByUserId].
  BoatByUserIdProvider({
    required this.id,
  }) : super.internal(
          (ref) => boatByUserId(
            ref,
            id: id,
          ),
          from: boatByUserIdProvider,
          name: r'boatByUserIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$boatByUserIdHash,
          dependencies: BoatByUserIdFamily._dependencies,
          allTransitiveDependencies:
              BoatByUserIdFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is BoatByUserIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
