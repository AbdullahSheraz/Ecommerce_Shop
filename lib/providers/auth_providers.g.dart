// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userProfileHash() => r'e05ce3c51b74ce402b755c1b175f6048311b4f04';

/// See also [userProfile].
@ProviderFor(userProfile)
final userProfileProvider = FutureProvider<UserModel>.internal(
  userProfile,
  name: r'userProfileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserProfileRef = FutureProviderRef<UserModel>;
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
