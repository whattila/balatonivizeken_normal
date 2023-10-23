// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boat.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$boatByIdHash() => r'68ee8a23e29ec6418a4c07c7551cc67060ad7ac9';

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

typedef BoatByIdRef = AutoDisposeFutureProviderRef<BoatDto?>;

/// See also [boatById].
@ProviderFor(boatById)
const boatByIdProvider = BoatByIdFamily();

/// See also [boatById].
class BoatByIdFamily extends Family<AsyncValue<BoatDto?>> {
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
class BoatByIdProvider extends AutoDisposeFutureProvider<BoatDto?> {
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

String _$boatByUserIdHash() => r'4b190de4c756a476b8ceccdfa1cfad0b4d0b8071';

/// See also [boatByUserId].
@ProviderFor(boatByUserId)
final boatByUserIdProvider = AutoDisposeFutureProvider<BoatDto?>.internal(
  boatByUserId,
  name: r'boatByUserIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$boatByUserIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BoatByUserIdRef = AutoDisposeFutureProviderRef<BoatDto?>;
String _$updateBoatHash() => r'93a6bffd0617528c46f20be3d46f27ee7c70d22f';
typedef UpdateBoatRef = AutoDisposeFutureProviderRef<BoatDto?>;

/// See also [updateBoat].
@ProviderFor(updateBoat)
const updateBoatProvider = UpdateBoatFamily();

/// See also [updateBoat].
class UpdateBoatFamily extends Family<AsyncValue<BoatDto?>> {
  /// See also [updateBoat].
  const UpdateBoatFamily();

  /// See also [updateBoat].
  UpdateBoatProvider call({
    required BoatType boatType,
    required String displayName,
  }) {
    return UpdateBoatProvider(
      boatType: boatType,
      displayName: displayName,
    );
  }

  @override
  UpdateBoatProvider getProviderOverride(
    covariant UpdateBoatProvider provider,
  ) {
    return call(
      boatType: provider.boatType,
      displayName: provider.displayName,
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
  String? get name => r'updateBoatProvider';
}

/// See also [updateBoat].
class UpdateBoatProvider extends AutoDisposeFutureProvider<BoatDto?> {
  /// See also [updateBoat].
  UpdateBoatProvider({
    required this.boatType,
    required this.displayName,
  }) : super.internal(
          (ref) => updateBoat(
            ref,
            boatType: boatType,
            displayName: displayName,
          ),
          from: updateBoatProvider,
          name: r'updateBoatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateBoatHash,
          dependencies: UpdateBoatFamily._dependencies,
          allTransitiveDependencies:
              UpdateBoatFamily._allTransitiveDependencies,
        );

  final BoatType boatType;
  final String displayName;

  @override
  bool operator ==(Object other) {
    return other is UpdateBoatProvider &&
        other.boatType == boatType &&
        other.displayName == displayName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, boatType.hashCode);
    hash = _SystemHash.combine(hash, displayName.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$boatIdHash() => r'68ab37f54f8e9fcebad2feca72d65f9c8927369d';

/// See also [BoatId].
@ProviderFor(BoatId)
final boatIdProvider = AutoDisposeNotifierProvider<BoatId, String?>.internal(
  BoatId.new,
  name: r'boatIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$boatIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BoatId = AutoDisposeNotifier<String?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
