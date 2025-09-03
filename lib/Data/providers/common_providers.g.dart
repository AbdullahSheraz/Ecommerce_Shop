// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countriesHash() => r'64ea8f218bc2812a4ea184e8eb4d928e5a3d3899';

/// See also [countries].
@ProviderFor(countries)
final countriesProvider = AutoDisposeStreamProvider<List<dynamic>>.internal(
  countries,
  name: r'countriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$countriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CountriesRef = AutoDisposeStreamProviderRef<List<dynamic>>;
String _$statesHash() => r'19de3ca4f745913c2696f5d22e35fae6ef4477f6';

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

/// See also [states].
@ProviderFor(states)
const statesProvider = StatesFamily();

/// See also [states].
class StatesFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [states].
  const StatesFamily();

  /// See also [states].
  StatesProvider call(
    String countryId,
  ) {
    return StatesProvider(
      countryId,
    );
  }

  @override
  StatesProvider getProviderOverride(
    covariant StatesProvider provider,
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
  String? get name => r'statesProvider';
}

/// See also [states].
class StatesProvider extends AutoDisposeStreamProvider<List<dynamic>> {
  /// See also [states].
  StatesProvider(
    String countryId,
  ) : this._internal(
          (ref) => states(
            ref as StatesRef,
            countryId,
          ),
          from: statesProvider,
          name: r'statesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$statesHash,
          dependencies: StatesFamily._dependencies,
          allTransitiveDependencies: StatesFamily._allTransitiveDependencies,
          countryId: countryId,
        );

  StatesProvider._internal(
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
    Stream<List<dynamic>> Function(StatesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StatesProvider._internal(
        (ref) => create(ref as StatesRef),
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
  AutoDisposeStreamProviderElement<List<dynamic>> createElement() {
    return _StatesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StatesProvider && other.countryId == countryId;
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
mixin StatesRef on AutoDisposeStreamProviderRef<List<dynamic>> {
  /// The parameter `countryId` of this provider.
  String get countryId;
}

class _StatesProviderElement
    extends AutoDisposeStreamProviderElement<List<dynamic>> with StatesRef {
  _StatesProviderElement(super.provider);

  @override
  String get countryId => (origin as StatesProvider).countryId;
}

String _$citiesHash() => r'2c39f32abc4e320ef4434b7b587ef8cd542fcb60';

/// See also [cities].
@ProviderFor(cities)
const citiesProvider = CitiesFamily();

/// See also [cities].
class CitiesFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [cities].
  const CitiesFamily();

  /// See also [cities].
  CitiesProvider call(
    String countryId,
    String stateId,
  ) {
    return CitiesProvider(
      countryId,
      stateId,
    );
  }

  @override
  CitiesProvider getProviderOverride(
    covariant CitiesProvider provider,
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
  String? get name => r'citiesProvider';
}

/// See also [cities].
class CitiesProvider extends AutoDisposeStreamProvider<List<dynamic>> {
  /// See also [cities].
  CitiesProvider(
    String countryId,
    String stateId,
  ) : this._internal(
          (ref) => cities(
            ref as CitiesRef,
            countryId,
            stateId,
          ),
          from: citiesProvider,
          name: r'citiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$citiesHash,
          dependencies: CitiesFamily._dependencies,
          allTransitiveDependencies: CitiesFamily._allTransitiveDependencies,
          countryId: countryId,
          stateId: stateId,
        );

  CitiesProvider._internal(
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
  final String stateId;

  @override
  Override overrideWith(
    Stream<List<dynamic>> Function(CitiesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CitiesProvider._internal(
        (ref) => create(ref as CitiesRef),
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
  AutoDisposeStreamProviderElement<List<dynamic>> createElement() {
    return _CitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CitiesProvider &&
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
mixin CitiesRef on AutoDisposeStreamProviderRef<List<dynamic>> {
  /// The parameter `countryId` of this provider.
  String get countryId;

  /// The parameter `stateId` of this provider.
  String get stateId;
}

class _CitiesProviderElement
    extends AutoDisposeStreamProviderElement<List<dynamic>> with CitiesRef {
  _CitiesProviderElement(super.provider);

  @override
  String get countryId => (origin as CitiesProvider).countryId;
  @override
  String get stateId => (origin as CitiesProvider).stateId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
