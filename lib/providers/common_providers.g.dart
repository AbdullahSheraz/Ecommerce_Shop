// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCountriesHash() => r'299fec45257ead3be16b919a7afcddaa0729da33';

/// See also [getCountries].
@ProviderFor(getCountries)
final getCountriesProvider = FutureProvider<List<dynamic>>.internal(
  getCountries,
  name: r'getCountriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getCountriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCountriesRef = FutureProviderRef<List<dynamic>>;
String _$getStatesHash() => r'028770bebd4dc4a518c299d53e6971fd7736f639';

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

/// See also [getStates].
@ProviderFor(getStates)
const getStatesProvider = GetStatesFamily();

/// See also [getStates].
class GetStatesFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [getStates].
  const GetStatesFamily();

  /// See also [getStates].
  GetStatesProvider call(
    String countryId,
  ) {
    return GetStatesProvider(
      countryId,
    );
  }

  @override
  GetStatesProvider getProviderOverride(
    covariant GetStatesProvider provider,
  ) {
    return call(
      provider.countryId,
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
  String? get name => r'getStatesProvider';
}

/// See also [getStates].
class GetStatesProvider extends FutureProvider<List<dynamic>> {
  /// See also [getStates].
  GetStatesProvider(
    String countryId,
  ) : this._internal(
          (ref) => getStates(
            ref as GetStatesRef,
            countryId,
          ),
          from: getStatesProvider,
          name: r'getStatesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getStatesHash,
          dependencies: GetStatesFamily._dependencies,
          allTransitiveDependencies: GetStatesFamily._allTransitiveDependencies,
          countryId: countryId,
        );

  GetStatesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.countryId,
  }) : super.internal();

  final String countryId;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(GetStatesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetStatesProvider._internal(
        (ref) => create(ref as GetStatesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        countryId: countryId,
      ),
    );
  }

  @override
  FutureProviderElement<List<dynamic>> createElement() {
    return _GetStatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetStatesProvider && other.countryId == countryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, countryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetStatesRef on FutureProviderRef<List<dynamic>> {
  /// The parameter `countryId` of this provider.
  String get countryId;
}

class _GetStatesProviderElement extends FutureProviderElement<List<dynamic>>
    with GetStatesRef {
  _GetStatesProviderElement(super.provider);

  @override
  String get countryId => (origin as GetStatesProvider).countryId;
}

String _$getCitiesHash() => r'6498d8039f30cc5ad061dfa35b7b0eaffa0c7d33';

/// See also [getCities].
@ProviderFor(getCities)
const getCitiesProvider = GetCitiesFamily();

/// See also [getCities].
class GetCitiesFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [getCities].
  const GetCitiesFamily();

  /// See also [getCities].
  GetCitiesProvider call(
    String countryId,
    String? stateId,
  ) {
    return GetCitiesProvider(
      countryId,
      stateId,
    );
  }

  @override
  GetCitiesProvider getProviderOverride(
    covariant GetCitiesProvider provider,
  ) {
    return call(
      provider.countryId,
      provider.stateId,
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
  String? get name => r'getCitiesProvider';
}

/// See also [getCities].
class GetCitiesProvider extends FutureProvider<List<dynamic>> {
  /// See also [getCities].
  GetCitiesProvider(
    String countryId,
    String? stateId,
  ) : this._internal(
          (ref) => getCities(
            ref as GetCitiesRef,
            countryId,
            stateId,
          ),
          from: getCitiesProvider,
          name: r'getCitiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCitiesHash,
          dependencies: GetCitiesFamily._dependencies,
          allTransitiveDependencies: GetCitiesFamily._allTransitiveDependencies,
          countryId: countryId,
          stateId: stateId,
        );

  GetCitiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.countryId,
    required this.stateId,
  }) : super.internal();

  final String countryId;
  final String? stateId;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(GetCitiesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCitiesProvider._internal(
        (ref) => create(ref as GetCitiesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        countryId: countryId,
        stateId: stateId,
      ),
    );
  }

  @override
  FutureProviderElement<List<dynamic>> createElement() {
    return _GetCitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCitiesProvider &&
        other.countryId == countryId &&
        other.stateId == stateId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, countryId.hashCode);
    hash = _SystemHash.combine(hash, stateId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCitiesRef on FutureProviderRef<List<dynamic>> {
  /// The parameter `countryId` of this provider.
  String get countryId;

  /// The parameter `stateId` of this provider.
  String? get stateId;
}

class _GetCitiesProviderElement extends FutureProviderElement<List<dynamic>>
    with GetCitiesRef {
  _GetCitiesProviderElement(super.provider);

  @override
  String get countryId => (origin as GetCitiesProvider).countryId;
  @override
  String? get stateId => (origin as GetCitiesProvider).stateId;
}

String _$getCountriesCodeHash() => r'629dc0462ab9cc21df7baa5e936a32aa90da8ca7';

/// See also [getCountriesCode].
@ProviderFor(getCountriesCode)
final getCountriesCodeProvider = FutureProvider<List<dynamic>>.internal(
  getCountriesCode,
  name: r'getCountriesCodeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCountriesCodeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCountriesCodeRef = FutureProviderRef<List<dynamic>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
