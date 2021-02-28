import 'dart:async';
import 'dart:io';

import 'package:BoilerPlateMVVM/core/App/locator.dart';
import 'package:BoilerPlateMVVM/core/Constants/AddmobConstant.dart';
import 'package:BoilerPlateMVVM/core/Constants/InappConstants.dart';
import 'package:BoilerPlateMVVM/core/helper/inAppCacheHelper.dart';
import 'package:BoilerPlateMVVM/core/services/SharedPreferencesService.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';

// import 'consumable_store.dart';

// const bool _kAutoConsume = true;

// const String _kConsumableId = 'consumable';
// const List<String> _kProductIds = <String>[
//   _kConsumableId,
//   'upgrade',
//   'subscription'
// ];

//TODO:
// Step 1 - Get Products and Past Purchases

// When the app is first initialized you must complete the following tasks:

// Fetch products.
// Fetch past purchases.
// Determine if the user has already purchased certain items and deliver them in the app.

// Step 2 - Handle New Purchases

// Allow the user to make a new purchase.
// Listen to a Stream that emits new purchases.

//Step 3 - Consume the Product
// If you are selling one-time upgrade purchase you’re done at this point. However, we turned autoConsume off in the previous step, so the product can only be repurchased the purchase has been marked as consumed.

// Keep in mind, you should also save the state of the consumable product on your backend database. It cannot be retrieved after the widget is destroyed.

@lazySingleton
class InAppService {
  final InAppPurchaseConnection _connection = InAppPurchaseConnection.instance;
  final _sharedPreferences = locator<SharedPreferencesService>();
  InAppCacheHelper consumableStore = InAppCacheHelper();

  StreamSubscription<List<PurchaseDetails>> _subscription;
  List<String> _notFoundIds = [];
  List<ProductDetails> _products = [];
  List<PurchaseDetails> _purchases = [];
  List<String> _consumables = [];
  bool _isAvailable = false;
  bool _purchasePending = false;
  bool _loading = true;
  String _queryProductError;

  InAppService() {
    listenToPurchaseStatus();
    initStoreInfo();
  }

  void dispose() {
    _subscription.cancel();
  }

  //!STEP:1
  Future<void> initStoreInfo() async {
    //inapp purchase not available
    final bool isAvailable = await _connection.isAvailable();
    if (!isAvailable) {
      _isAvailable = isAvailable;
      _products = [];
      _purchases = [];
      _notFoundIds = [];
      _consumables = [];
      _purchasePending = false;
      _loading = false;

      return;
    }

    // Fetch products.
    ProductDetailsResponse productDetailResponse = await _connection
        .queryProductDetails(InAppConstants.kProductIds.toSet());
    if (productDetailResponse.error != null) {
      _queryProductError = productDetailResponse.error.message;
      _isAvailable = isAvailable;
      _products = productDetailResponse.productDetails;
      _purchases = [];
      _notFoundIds = productDetailResponse.notFoundIDs;
      _consumables = [];
      _purchasePending = false;
      _loading = false;

      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      _queryProductError = null;
      _isAvailable = isAvailable;
      _products = productDetailResponse.productDetails;
      _purchases = [];
      _notFoundIds = productDetailResponse.notFoundIDs;
      _consumables = [];
      _purchasePending = false;
      _loading = false;

      return;
    }

    // Fetch past purchases.
    final QueryPurchaseDetailsResponse purchaseResponse =
        await _connection.queryPastPurchases();
    if (purchaseResponse.error != null) {
      // handle query past purchase error..
    }
    //verify past purchases
    final List<PurchaseDetails> verifiedPurchases = [];
    for (PurchaseDetails purchase in purchaseResponse.pastPurchases) {
      if (await _verifyPurchase(purchase)) {
        verifiedPurchases.add(purchase);
      }
    }
    List<String> consumables = await consumableStore.load();
    //use these in the ui or viewmodel
    _isAvailable = isAvailable;
    _products = productDetailResponse.productDetails;
    _purchases = verifiedPurchases;
    _notFoundIds = productDetailResponse.notFoundIDs;
    _consumables = consumables;
    _purchasePending = false;
    _loading = false;
  }

  //!STEP:2
  //buy wither consumable or non consumable
  void buy(ProductDetails productDetails) {
    PurchaseParam purchaseParam = PurchaseParam(
        productDetails: productDetails,
        applicationUserName: null,
        sandboxTesting: true);
    if (productDetails.id == InAppConstants.kConsumableId) {
      _connection.buyConsumable(
          purchaseParam: purchaseParam,
          autoConsume: InAppConstants.kAutoConsume || Platform.isIOS);
    } else {
      _connection.buyNonConsumable(purchaseParam: purchaseParam);
    }
  }

  //MARK:PURCHASE STATUS stream we get after we buy a product
  void listenToPurchaseStatus() {
    Stream purchaseUpdated =
        InAppPurchaseConnection.instance.purchaseUpdatedStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      //status ongoing
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      // when status completed.
      _subscription.cancel();
    }, onError: (error) {
      print("ERROR $error");
      // handle error here.
    });
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        _purchasePending = true;
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          _purchasePending = false;
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
          bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            deliverProduct(purchaseDetails);
          } else {
            _handleInvalidPurchase(purchaseDetails);
            return;
          }
        }
        if (Platform.isAndroid) {
          if (!InAppConstants.kAutoConsume &&
              purchaseDetails.productID == InAppConstants.kConsumableId) {
            await InAppPurchaseConnection.instance
                .consumePurchase(purchaseDetails);
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchaseConnection.instance
              .completePurchase(purchaseDetails);
        }
      }
    });
  }

  //MARK:VERIFICATION
  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    // IMPORTANT!! Always verify a purchase before delivering the product.
    // For the purpose of an example, we directly return true.
    return Future<bool>.value(true);
  }

  void _handleInvalidPurchase(PurchaseDetails purchaseDetails) {
    // handle invalid purchase here if  _verifyPurchase` failed.
  }

  //MARK:DELIVER product to app after purchase either in the form of consumables or purcahses
  void deliverProduct(PurchaseDetails purchaseDetails) async {
    // IMPORTANT!! Always verify a purchase purchase details before delivering the product.
    if (purchaseDetails.productID == InAppConstants.kConsumableId) {
      await consumableStore.save(purchaseDetails.purchaseID);
      List<String> consumables = await consumableStore.load();

      _purchasePending = false;
      _consumables = consumables;
    } else {
      _purchases.add(purchaseDetails);
      _purchasePending = false;
    }
  }

  //!STEP:3 consume product
  Future<void> consume(String id) async {
    await consumableStore.consume(id);
    final List<String> consumables = await consumableStore.load();

    _consumables = consumables;
  }
}
