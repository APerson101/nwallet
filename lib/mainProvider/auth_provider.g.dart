// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadConfigHash() => r'fb478e75d6187bfb239839bf518565973ea14685';

/// See also [loadConfig].
@ProviderFor(loadConfig)
final loadConfigProvider = AutoDisposeFutureProvider<void>.internal(
  loadConfig,
  name: r'loadConfigProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loadConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoadConfigRef = AutoDisposeFutureProviderRef<void>;
String _$loadCurrentUserHash() => r'23932216515c575f248cd65075540c7076dd5054';

/// See also [loadCurrentUser].
@ProviderFor(loadCurrentUser)
final loadCurrentUserProvider = AutoDisposeFutureProvider<AuthUser>.internal(
  loadCurrentUser,
  name: r'loadCurrentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadCurrentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoadCurrentUserRef = AutoDisposeFutureProviderRef<AuthUser>;
String _$loadUserAccountHash() => r'0eba80591c3c3a4ea9fd0a7fc2e7aeb8a12f6001';

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

/// See also [loadUserAccount].
@ProviderFor(loadUserAccount)
const loadUserAccountProvider = LoadUserAccountFamily();

/// See also [loadUserAccount].
class LoadUserAccountFamily extends Family<AsyncValue<UserAccount>> {
  /// See also [loadUserAccount].
  const LoadUserAccountFamily();

  /// See also [loadUserAccount].
  LoadUserAccountProvider call(
    String id,
  ) {
    return LoadUserAccountProvider(
      id,
    );
  }

  @override
  LoadUserAccountProvider getProviderOverride(
    covariant LoadUserAccountProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'loadUserAccountProvider';
}

/// See also [loadUserAccount].
class LoadUserAccountProvider extends AutoDisposeFutureProvider<UserAccount> {
  /// See also [loadUserAccount].
  LoadUserAccountProvider(
    String id,
  ) : this._internal(
          (ref) => loadUserAccount(
            ref as LoadUserAccountRef,
            id,
          ),
          from: loadUserAccountProvider,
          name: r'loadUserAccountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadUserAccountHash,
          dependencies: LoadUserAccountFamily._dependencies,
          allTransitiveDependencies:
              LoadUserAccountFamily._allTransitiveDependencies,
          id: id,
        );

  LoadUserAccountProvider._internal(
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
    FutureOr<UserAccount> Function(LoadUserAccountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadUserAccountProvider._internal(
        (ref) => create(ref as LoadUserAccountRef),
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
  AutoDisposeFutureProviderElement<UserAccount> createElement() {
    return _LoadUserAccountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadUserAccountProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoadUserAccountRef on AutoDisposeFutureProviderRef<UserAccount> {
  /// The parameter `id` of this provider.
  String get id;
}

class _LoadUserAccountProviderElement
    extends AutoDisposeFutureProviderElement<UserAccount>
    with LoadUserAccountRef {
  _LoadUserAccountProviderElement(super.provider);

  @override
  String get id => (origin as LoadUserAccountProvider).id;
}

String _$createEGLDAccountHash() => r'346e940bc1b7e7d48874e74e05cd090c5b5b5ab4';

/// See also [createEGLDAccount].
@ProviderFor(createEGLDAccount)
const createEGLDAccountProvider = CreateEGLDAccountFamily();

/// See also [createEGLDAccount].
class CreateEGLDAccountFamily extends Family<AsyncValue<UserAccount>> {
  /// See also [createEGLDAccount].
  const CreateEGLDAccountFamily();

  /// See also [createEGLDAccount].
  CreateEGLDAccountProvider call(
    String id,
  ) {
    return CreateEGLDAccountProvider(
      id,
    );
  }

  @override
  CreateEGLDAccountProvider getProviderOverride(
    covariant CreateEGLDAccountProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'createEGLDAccountProvider';
}

/// See also [createEGLDAccount].
class CreateEGLDAccountProvider extends AutoDisposeFutureProvider<UserAccount> {
  /// See also [createEGLDAccount].
  CreateEGLDAccountProvider(
    String id,
  ) : this._internal(
          (ref) => createEGLDAccount(
            ref as CreateEGLDAccountRef,
            id,
          ),
          from: createEGLDAccountProvider,
          name: r'createEGLDAccountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createEGLDAccountHash,
          dependencies: CreateEGLDAccountFamily._dependencies,
          allTransitiveDependencies:
              CreateEGLDAccountFamily._allTransitiveDependencies,
          id: id,
        );

  CreateEGLDAccountProvider._internal(
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
    FutureOr<UserAccount> Function(CreateEGLDAccountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateEGLDAccountProvider._internal(
        (ref) => create(ref as CreateEGLDAccountRef),
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
  AutoDisposeFutureProviderElement<UserAccount> createElement() {
    return _CreateEGLDAccountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateEGLDAccountProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateEGLDAccountRef on AutoDisposeFutureProviderRef<UserAccount> {
  /// The parameter `id` of this provider.
  String get id;
}

class _CreateEGLDAccountProviderElement
    extends AutoDisposeFutureProviderElement<UserAccount>
    with CreateEGLDAccountRef {
  _CreateEGLDAccountProviderElement(super.provider);

  @override
  String get id => (origin as CreateEGLDAccountProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
