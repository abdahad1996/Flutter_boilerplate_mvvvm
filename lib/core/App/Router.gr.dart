// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../ui/views/dark/light_Theme/dark_light_view.dart';
import '../../ui/views/multipleThemes/multiple_themes_view.dart';

class Routes {
  static const String darkLightView = '/';
  static const String multipleThemesView = '/multiple-themes-view';
  static const all = <String>{
    darkLightView,
    multipleThemesView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.darkLightView, page: DarkLightView),
    RouteDef(Routes.multipleThemesView, page: MultipleThemesView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    DarkLightView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DarkLightView(),
        settings: data,
      );
    },
    MultipleThemesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MultipleThemesView(),
        settings: data,
      );
    },
  };
}
