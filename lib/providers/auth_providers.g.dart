// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userProfileHash() => r'9b41bae176918993da86c0f6f6044bfe74dd0130';

/// See also [userProfile].
@ProviderFor(userProfile)
final userProfileProvider = AutoDisposeFutureProvider<UserModel>.internal(
  userProfile,
  name: r'userProfileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserProfileRef = AutoDisposeFutureProviderRef<UserModel>;
String _$categoriesHash() => r'11ef38f9afb1a5925c83b4b22a92785f73a23d4d';

/// See also [categories].
@ProviderFor(categories)
final categoriesProvider = AutoDisposeFutureProvider<List<Category>>.internal(
  categories,
  name: r'categoriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$categoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoriesRef = AutoDisposeFutureProviderRef<List<Category>>;
String _$brandsHash() => r'a83ffd3651e5f458397d9cbdf2f5b2e1e4b7cf08';

/// See also [brands].
@ProviderFor(brands)
final brandsProvider = AutoDisposeFutureProvider<List<Brand>>.internal(
  brands,
  name: r'brandsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$brandsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BrandsRef = AutoDisposeFutureProviderRef<List<Brand>>;
String _$authProvidersHash() => r'7125a45b125566fc12d741036d42338838688397';

/// See also [AuthProviders].
@ProviderFor(AuthProviders)
final authProvidersProvider =
    AutoDisposeNotifierProvider<AuthProviders, bool>.internal(
  AuthProviders.new,
  name: r'authProvidersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authProvidersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthProviders = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
