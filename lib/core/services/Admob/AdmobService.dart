import 'package:BoilerPlateMVVM/core/Constants/AddmobConstant.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AdmobService {
  MobileAdTargetingInfo targetingInfo;
  BannerAd myBanner;
  InterstitialAd myInterstitial;
  bool _isInterstitialAdReady;
  bool _isbannerAdReady;

  AdmobService() {
    FirebaseAdMob.instance.initialize(appId: AdMobConstants.appId);
    targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['flutterio', 'beautiful apps'],
      contentUrl: 'https://flutter.io',
      childDirected: false,
      // or MobileAdGender.female, MobileAdGender.unknown
      testDevices: <String>[], // Android emulators are considered test devices
    );

    myBanner = BannerAd(
        // Replace the testAdUnitId with an ad unit id from the AdMob dash.
        // https://developers.google.com/admob/android/test-ads
        // https://developers.google.com/admob/ios/test-ads
        adUnitId: AdMobConstants.bannerAdUnitId,
        size: AdSize.smartBanner,
        targetingInfo: targetingInfo,
        listener: _onBannerAdEvent);
    myInterstitial = InterstitialAd(
        // Replace the testAdUnitId with an ad unit id from the AdMob dash.
        // https://developers.google.com/admob/android/test-ads
        // https://developers.google.com/admob/ios/test-ads
        adUnitId: AdMobConstants.interstitialAdUnitId,
        targetingInfo: targetingInfo,
        listener: _onInterstitialAdEvent);
  }

  // TODO: Implement _loadBannerAd()
  void _loadBannerAd({bool isTop = false}) {
    myBanner
      ..load()
      ..show(
        anchorType: isTop ? AnchorType.top : AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
  }

  // TODO: Implement _loadInterstitialAd()
  void _loadInterstitialAd({bool isTop = false}) {
    myInterstitial
      ..load()
      ..show(
        anchorType: isTop ? AnchorType.top : AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
  }

  // TODO: Implement _onInterstitialAdEvent()
  void _onInterstitialAdEvent(MobileAdEvent event) {
    switch (event) {
      case MobileAdEvent.loaded:
        _isInterstitialAdReady = true;
        break;
      case MobileAdEvent.failedToLoad:
        _isInterstitialAdReady = false;
        print('Failed to load an interstitial ad');
        break;
      case MobileAdEvent.closed:
        // _moveToHome();
        break;
      default:
      // do nothing
    }
  }

  // TODO: Implement _onInterstitialAdEvent()
  void _onBannerAdEvent(MobileAdEvent event) {
    switch (event) {
      case MobileAdEvent.loaded:
        _isbannerAdReady = true;
        break;
      case MobileAdEvent.failedToLoad:
        _isbannerAdReady = false;
        print('Failed to load an interstitial ad');
        break;
      case MobileAdEvent.closed:
        // _moveToHome();
        break;
      default:
      // do nothing
    }
  }

  void dispose() {
    myBanner?.dispose();
    myInterstitial?.dispose();
  }
}
