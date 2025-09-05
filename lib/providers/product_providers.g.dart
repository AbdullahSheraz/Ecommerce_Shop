// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCategoriesHash() => r'ee4b03648127a512f3a58b94cc132f3b7bf6e175';

/// See also [getCategories].
@ProviderFor(getCategories)
final getCategoriesProvider = FutureProvider<List<Category>>.internal(
  getCategories,
  name: r'getCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCategoriesRef = FutureProviderRef<List<Category>>;
String _$getBrandsHash() => r'272c3fc6493044af6524e6f1eacce63158c61741';

/// See also [getBrands].
@ProviderFor(getBrands)
final getBrandsProvider = FutureProvider<List<Brand>>.internal(
  getBrands,
  name: r'getBrandsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getBrandsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetBrandsRef = FutureProviderRef<List<Brand>>;
String _$getItemsHash() => r'0df48bee3ec30329bde48305f1b9b9776af10a4e';

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

/// See also [getItems].
@ProviderFor(getItems)
const getItemsProvider = GetItemsFamily();

/// See also [getItems].
class GetItemsFamily extends Family<AsyncValue<List<Item>>> {
  /// See also [getItems].
  const GetItemsFamily();

  /// See also [getItems].
  GetItemsProvider call(
    String categoryId,
    String brandId,
  ) {
    return GetItemsProvider(
      categoryId,
      brandId,
    );
  }

  @override
  GetItemsProvider getProviderOverride(
    covariant GetItemsProvider provider,
  ) {
    return call(
      provider.categoryId,
      provider.brandId,
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
  String? get name => r'getItemsProvider';
}

/// See also [getItems].
class GetItemsProvider extends FutureProvider<List<Item>> {
  /// See also [getItems].
  GetItemsProvider(
    String categoryId,
    String brandId,
  ) : this._internal(
          (ref) => getItems(
            ref as GetItemsRef,
            categoryId,
            brandId,
          ),
          from: getItemsProvider,
          name: r'getItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getItemsHash,
          dependencies: GetItemsFamily._dependencies,
          allTransitiveDependencies: GetItemsFamily._allTransitiveDependencies,
          categoryId: categoryId,
          brandId: brandId,
        );

  GetItemsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.brandId,
  }) : super.internal();

  final String categoryId;
  final String brandId;

  @override
  Override overrideWith(
    FutureOr<List<Item>> Function(GetItemsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetItemsProvider._internal(
        (ref) => create(ref as GetItemsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        brandId: brandId,
      ),
    );
  }

  @override
  FutureProviderElement<List<Item>> createElement() {
    return _GetItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetItemsProvider &&
        other.categoryId == categoryId &&
        other.brandId == brandId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, brandId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetItemsRef on FutureProviderRef<List<Item>> {
  /// The parameter `categoryId` of this provider.
  String get categoryId;

  /// The parameter `brandId` of this provider.
  String get brandId;
}

class _GetItemsProviderElement extends FutureProviderElement<List<Item>>
    with GetItemsRef {
  _GetItemsProviderElement(super.provider);

  @override
  String get categoryId => (origin as GetItemsProvider).categoryId;
  @override
  String get brandId => (origin as GetItemsProvider).brandId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
