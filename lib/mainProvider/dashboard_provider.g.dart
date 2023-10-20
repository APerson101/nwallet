// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transferTokensHash() => r'0fa394a6aaaae6200dce655c3a23ae65b67d1457';

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

/// See also [transferTokens].
@ProviderFor(transferTokens)
const transferTokensProvider = TransferTokensFamily();

/// See also [transferTokens].
class TransferTokensFamily extends Family<AsyncValue<void>> {
  /// See also [transferTokens].
  const TransferTokensFamily();

  /// See also [transferTokens].
  TransferTokensProvider call(
    String type,
    String? amount,
    String? nftID,
    String receiver,
    String senderWords,
    int? quantity,
  ) {
    return TransferTokensProvider(
      type,
      amount,
      nftID,
      receiver,
      senderWords,
      quantity,
    );
  }

  @override
  TransferTokensProvider getProviderOverride(
    covariant TransferTokensProvider provider,
  ) {
    return call(
      provider.type,
      provider.amount,
      provider.nftID,
      provider.receiver,
      provider.senderWords,
      provider.quantity,
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
  String? get name => r'transferTokensProvider';
}

/// See also [transferTokens].
class TransferTokensProvider extends AutoDisposeFutureProvider<void> {
  /// See also [transferTokens].
  TransferTokensProvider(
    String type,
    String? amount,
    String? nftID,
    String receiver,
    String senderWords,
    int? quantity,
  ) : this._internal(
          (ref) => transferTokens(
            ref as TransferTokensRef,
            type,
            amount,
            nftID,
            receiver,
            senderWords,
            quantity,
          ),
          from: transferTokensProvider,
          name: r'transferTokensProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transferTokensHash,
          dependencies: TransferTokensFamily._dependencies,
          allTransitiveDependencies:
              TransferTokensFamily._allTransitiveDependencies,
          type: type,
          amount: amount,
          nftID: nftID,
          receiver: receiver,
          senderWords: senderWords,
          quantity: quantity,
        );

  TransferTokensProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
    required this.amount,
    required this.nftID,
    required this.receiver,
    required this.senderWords,
    required this.quantity,
  }) : super.internal();

  final String type;
  final String? amount;
  final String? nftID;
  final String receiver;
  final String senderWords;
  final int? quantity;

  @override
  Override overrideWith(
    FutureOr<void> Function(TransferTokensRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TransferTokensProvider._internal(
        (ref) => create(ref as TransferTokensRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
        amount: amount,
        nftID: nftID,
        receiver: receiver,
        senderWords: senderWords,
        quantity: quantity,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _TransferTokensProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransferTokensProvider &&
        other.type == type &&
        other.amount == amount &&
        other.nftID == nftID &&
        other.receiver == receiver &&
        other.senderWords == senderWords &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, amount.hashCode);
    hash = _SystemHash.combine(hash, nftID.hashCode);
    hash = _SystemHash.combine(hash, receiver.hashCode);
    hash = _SystemHash.combine(hash, senderWords.hashCode);
    hash = _SystemHash.combine(hash, quantity.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TransferTokensRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `type` of this provider.
  String get type;

  /// The parameter `amount` of this provider.
  String? get amount;

  /// The parameter `nftID` of this provider.
  String? get nftID;

  /// The parameter `receiver` of this provider.
  String get receiver;

  /// The parameter `senderWords` of this provider.
  String get senderWords;

  /// The parameter `quantity` of this provider.
  int? get quantity;
}

class _TransferTokensProviderElement
    extends AutoDisposeFutureProviderElement<void> with TransferTokensRef {
  _TransferTokensProviderElement(super.provider);

  @override
  String get type => (origin as TransferTokensProvider).type;
  @override
  String? get amount => (origin as TransferTokensProvider).amount;
  @override
  String? get nftID => (origin as TransferTokensProvider).nftID;
  @override
  String get receiver => (origin as TransferTokensProvider).receiver;
  @override
  String get senderWords => (origin as TransferTokensProvider).senderWords;
  @override
  int? get quantity => (origin as TransferTokensProvider).quantity;
}

String _$getEGLDBalanceHash() => r'a5fcfe6c02643709a3ddd50f4b27ccd6e01673bf';

/// See also [getEGLDBalance].
@ProviderFor(getEGLDBalance)
final getEGLDBalanceProvider = AutoDisposeFutureProvider<String>.internal(
  getEGLDBalance,
  name: r'getEGLDBalanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getEGLDBalanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetEGLDBalanceRef = AutoDisposeFutureProviderRef<String>;
String _$getTransactionsHash() => r'a54ddaa69e99299c2a14d895c04801b072c1e214';

/// See also [getTransactions].
@ProviderFor(getTransactions)
final getTransactionsProvider =
    AutoDisposeFutureProvider<List<TransactionInfo>>.internal(
  getTransactions,
  name: r'getTransactionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getTransactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTransactionsRef
    = AutoDisposeFutureProviderRef<List<TransactionInfo>>;
String _$createTicketNFTHash() => r'599d52dbe0019f4db0798ff5e14247d45fb994ff';

/// See also [createTicketNFT].
@ProviderFor(createTicketNFT)
const createTicketNFTProvider = CreateTicketNFTFamily();

/// See also [createTicketNFT].
class CreateTicketNFTFamily extends Family<AsyncValue<void>> {
  /// See also [createTicketNFT].
  const CreateTicketNFTFamily();

  /// See also [createTicketNFT].
  CreateTicketNFTProvider call(
    int quantity,
    int value,
    String location,
    String date,
    List<XFile> uris,
    String description,
    String ticker,
    String nftname,
  ) {
    return CreateTicketNFTProvider(
      quantity,
      value,
      location,
      date,
      uris,
      description,
      ticker,
      nftname,
    );
  }

  @override
  CreateTicketNFTProvider getProviderOverride(
    covariant CreateTicketNFTProvider provider,
  ) {
    return call(
      provider.quantity,
      provider.value,
      provider.location,
      provider.date,
      provider.uris,
      provider.description,
      provider.ticker,
      provider.nftname,
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
  String? get name => r'createTicketNFTProvider';
}

/// See also [createTicketNFT].
class CreateTicketNFTProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createTicketNFT].
  CreateTicketNFTProvider(
    int quantity,
    int value,
    String location,
    String date,
    List<XFile> uris,
    String description,
    String ticker,
    String nftname,
  ) : this._internal(
          (ref) => createTicketNFT(
            ref as CreateTicketNFTRef,
            quantity,
            value,
            location,
            date,
            uris,
            description,
            ticker,
            nftname,
          ),
          from: createTicketNFTProvider,
          name: r'createTicketNFTProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createTicketNFTHash,
          dependencies: CreateTicketNFTFamily._dependencies,
          allTransitiveDependencies:
              CreateTicketNFTFamily._allTransitiveDependencies,
          quantity: quantity,
          value: value,
          location: location,
          date: date,
          uris: uris,
          description: description,
          ticker: ticker,
          nftname: nftname,
        );

  CreateTicketNFTProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quantity,
    required this.value,
    required this.location,
    required this.date,
    required this.uris,
    required this.description,
    required this.ticker,
    required this.nftname,
  }) : super.internal();

  final int quantity;
  final int value;
  final String location;
  final String date;
  final List<XFile> uris;
  final String description;
  final String ticker;
  final String nftname;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateTicketNFTRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateTicketNFTProvider._internal(
        (ref) => create(ref as CreateTicketNFTRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quantity: quantity,
        value: value,
        location: location,
        date: date,
        uris: uris,
        description: description,
        ticker: ticker,
        nftname: nftname,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateTicketNFTProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateTicketNFTProvider &&
        other.quantity == quantity &&
        other.value == value &&
        other.location == location &&
        other.date == date &&
        other.uris == uris &&
        other.description == description &&
        other.ticker == ticker &&
        other.nftname == nftname;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quantity.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);
    hash = _SystemHash.combine(hash, location.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, uris.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);
    hash = _SystemHash.combine(hash, ticker.hashCode);
    hash = _SystemHash.combine(hash, nftname.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateTicketNFTRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `quantity` of this provider.
  int get quantity;

  /// The parameter `value` of this provider.
  int get value;

  /// The parameter `location` of this provider.
  String get location;

  /// The parameter `date` of this provider.
  String get date;

  /// The parameter `uris` of this provider.
  List<XFile> get uris;

  /// The parameter `description` of this provider.
  String get description;

  /// The parameter `ticker` of this provider.
  String get ticker;

  /// The parameter `nftname` of this provider.
  String get nftname;
}

class _CreateTicketNFTProviderElement
    extends AutoDisposeFutureProviderElement<void> with CreateTicketNFTRef {
  _CreateTicketNFTProviderElement(super.provider);

  @override
  int get quantity => (origin as CreateTicketNFTProvider).quantity;
  @override
  int get value => (origin as CreateTicketNFTProvider).value;
  @override
  String get location => (origin as CreateTicketNFTProvider).location;
  @override
  String get date => (origin as CreateTicketNFTProvider).date;
  @override
  List<XFile> get uris => (origin as CreateTicketNFTProvider).uris;
  @override
  String get description => (origin as CreateTicketNFTProvider).description;
  @override
  String get ticker => (origin as CreateTicketNFTProvider).ticker;
  @override
  String get nftname => (origin as CreateTicketNFTProvider).nftname;
}

String _$createEstateNFTHash() => r'e701e5fbe1ea1fb85046a44288584e0a0dcf7129';

/// See also [createEstateNFT].
@ProviderFor(createEstateNFT)
const createEstateNFTProvider = CreateEstateNFTFamily();

/// See also [createEstateNFT].
class CreateEstateNFTFamily extends Family<AsyncValue<void>> {
  /// See also [createEstateNFT].
  const CreateEstateNFTFamily();

  /// See also [createEstateNFT].
  CreateEstateNFTProvider call(
    int quantity,
    int value,
    String longitude,
    String latitude,
    List<XFile> uris,
    String description,
    String ticker,
    String nftname,
  ) {
    return CreateEstateNFTProvider(
      quantity,
      value,
      longitude,
      latitude,
      uris,
      description,
      ticker,
      nftname,
    );
  }

  @override
  CreateEstateNFTProvider getProviderOverride(
    covariant CreateEstateNFTProvider provider,
  ) {
    return call(
      provider.quantity,
      provider.value,
      provider.longitude,
      provider.latitude,
      provider.uris,
      provider.description,
      provider.ticker,
      provider.nftname,
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
  String? get name => r'createEstateNFTProvider';
}

/// See also [createEstateNFT].
class CreateEstateNFTProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createEstateNFT].
  CreateEstateNFTProvider(
    int quantity,
    int value,
    String longitude,
    String latitude,
    List<XFile> uris,
    String description,
    String ticker,
    String nftname,
  ) : this._internal(
          (ref) => createEstateNFT(
            ref as CreateEstateNFTRef,
            quantity,
            value,
            longitude,
            latitude,
            uris,
            description,
            ticker,
            nftname,
          ),
          from: createEstateNFTProvider,
          name: r'createEstateNFTProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createEstateNFTHash,
          dependencies: CreateEstateNFTFamily._dependencies,
          allTransitiveDependencies:
              CreateEstateNFTFamily._allTransitiveDependencies,
          quantity: quantity,
          value: value,
          longitude: longitude,
          latitude: latitude,
          uris: uris,
          description: description,
          ticker: ticker,
          nftname: nftname,
        );

  CreateEstateNFTProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quantity,
    required this.value,
    required this.longitude,
    required this.latitude,
    required this.uris,
    required this.description,
    required this.ticker,
    required this.nftname,
  }) : super.internal();

  final int quantity;
  final int value;
  final String longitude;
  final String latitude;
  final List<XFile> uris;
  final String description;
  final String ticker;
  final String nftname;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateEstateNFTRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateEstateNFTProvider._internal(
        (ref) => create(ref as CreateEstateNFTRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quantity: quantity,
        value: value,
        longitude: longitude,
        latitude: latitude,
        uris: uris,
        description: description,
        ticker: ticker,
        nftname: nftname,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateEstateNFTProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateEstateNFTProvider &&
        other.quantity == quantity &&
        other.value == value &&
        other.longitude == longitude &&
        other.latitude == latitude &&
        other.uris == uris &&
        other.description == description &&
        other.ticker == ticker &&
        other.nftname == nftname;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quantity.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);
    hash = _SystemHash.combine(hash, longitude.hashCode);
    hash = _SystemHash.combine(hash, latitude.hashCode);
    hash = _SystemHash.combine(hash, uris.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);
    hash = _SystemHash.combine(hash, ticker.hashCode);
    hash = _SystemHash.combine(hash, nftname.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateEstateNFTRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `quantity` of this provider.
  int get quantity;

  /// The parameter `value` of this provider.
  int get value;

  /// The parameter `longitude` of this provider.
  String get longitude;

  /// The parameter `latitude` of this provider.
  String get latitude;

  /// The parameter `uris` of this provider.
  List<XFile> get uris;

  /// The parameter `description` of this provider.
  String get description;

  /// The parameter `ticker` of this provider.
  String get ticker;

  /// The parameter `nftname` of this provider.
  String get nftname;
}

class _CreateEstateNFTProviderElement
    extends AutoDisposeFutureProviderElement<void> with CreateEstateNFTRef {
  _CreateEstateNFTProviderElement(super.provider);

  @override
  int get quantity => (origin as CreateEstateNFTProvider).quantity;
  @override
  int get value => (origin as CreateEstateNFTProvider).value;
  @override
  String get longitude => (origin as CreateEstateNFTProvider).longitude;
  @override
  String get latitude => (origin as CreateEstateNFTProvider).latitude;
  @override
  List<XFile> get uris => (origin as CreateEstateNFTProvider).uris;
  @override
  String get description => (origin as CreateEstateNFTProvider).description;
  @override
  String get ticker => (origin as CreateEstateNFTProvider).ticker;
  @override
  String get nftname => (origin as CreateEstateNFTProvider).nftname;
}

String _$searchForNFTSHash() => r'28395b1574d5b454e4add56d2cdcc8f1eb46d37b';

/// See also [searchForNFTS].
@ProviderFor(searchForNFTS)
const searchForNFTSProvider = SearchForNFTSFamily();

/// See also [searchForNFTS].
class SearchForNFTSFamily
    extends Family<AsyncValue<(List<TicketNFT>, List<RealEstateNFT>)>> {
  /// See also [searchForNFTS].
  const SearchForNFTSFamily();

  /// See also [searchForNFTS].
  SearchForNFTSProvider call(
    String searchTerm,
  ) {
    return SearchForNFTSProvider(
      searchTerm,
    );
  }

  @override
  SearchForNFTSProvider getProviderOverride(
    covariant SearchForNFTSProvider provider,
  ) {
    return call(
      provider.searchTerm,
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
  String? get name => r'searchForNFTSProvider';
}

/// See also [searchForNFTS].
class SearchForNFTSProvider
    extends AutoDisposeFutureProvider<(List<TicketNFT>, List<RealEstateNFT>)> {
  /// See also [searchForNFTS].
  SearchForNFTSProvider(
    String searchTerm,
  ) : this._internal(
          (ref) => searchForNFTS(
            ref as SearchForNFTSRef,
            searchTerm,
          ),
          from: searchForNFTSProvider,
          name: r'searchForNFTSProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchForNFTSHash,
          dependencies: SearchForNFTSFamily._dependencies,
          allTransitiveDependencies:
              SearchForNFTSFamily._allTransitiveDependencies,
          searchTerm: searchTerm,
        );

  SearchForNFTSProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchTerm,
  }) : super.internal();

  final String searchTerm;

  @override
  Override overrideWith(
    FutureOr<(List<TicketNFT>, List<RealEstateNFT>)> Function(
            SearchForNFTSRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchForNFTSProvider._internal(
        (ref) => create(ref as SearchForNFTSRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchTerm: searchTerm,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<(List<TicketNFT>, List<RealEstateNFT>)>
      createElement() {
    return _SearchForNFTSProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchForNFTSProvider && other.searchTerm == searchTerm;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchTerm.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchForNFTSRef
    on AutoDisposeFutureProviderRef<(List<TicketNFT>, List<RealEstateNFT>)> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;
}

class _SearchForNFTSProviderElement extends AutoDisposeFutureProviderElement<
    (List<TicketNFT>, List<RealEstateNFT>)> with SearchForNFTSRef {
  _SearchForNFTSProviderElement(super.provider);

  @override
  String get searchTerm => (origin as SearchForNFTSProvider).searchTerm;
}

String _$getNFTBalanceHash() => r'6a07f619cf22cadff089140ae3546dbd8a7169b4';

/// See also [getNFTBalance].
@ProviderFor(getNFTBalance)
final getNFTBalanceProvider = AutoDisposeFutureProvider<
    List<({String identifier, String name})>>.internal(
  getNFTBalance,
  name: r'getNFTBalanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getNFTBalanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNFTBalanceRef
    = AutoDisposeFutureProviderRef<List<({String identifier, String name})>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
