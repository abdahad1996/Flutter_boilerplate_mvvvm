// import 'package:Practice_Stacked/App/locator.dart';
// import 'package:Practice_Stacked/System/Database.dart';
// import 'package:Practice_Stacked/model/address.dart';
// import 'package:Practice_Stacked/services/shared_preferences_service.dart';
// import 'package:mockito/mockito.dart';
// import 'package:stacked_services/stacked_services.dart';

// // ignore: camel_case_types
// //  We want to Mock out the SharedPreferencesService. So lets create a mock
// class SharedPreferencesServiceMock extends Mock implements
// SharedPreferencesService {}
// class NavigationServiceMock extends Mock implements NavigationService{}
// // class AppDatabaseMock extends Mock implements Database {}

// // First thing we can see is that we won't want to create the instance and register it with the locator everytime we write a test. As you can imaging, this would require about 15 tests and I don't like duplicated code. So in the test_helpers.dart class we'll create a function that constructs,
// //  registers and returns to us a mock to use.
// SharedPreferencesService getAndRegisterSharedPreferencesMock({bool hasUser:true}) {
//         _removeRegistrationIfExists<SharedPreferencesService>();

//   var service = SharedPreferencesServiceMock();
//   // locator.registerLazySingleton(() => service);
//    //we are stubbing that
//   //if service.hasuser is called return true
//   when(service.hasUser).thenReturn(hasUser);
//      locator.registerSingleton<SharedPreferencesService>(service);

//   return service;
// }

// NavigationService getAndRegisterNavigationServiceMock() {
//       _removeRegistrationIfExists<NavigationService>();

//   var service = NavigationServiceMock();
 
//   locator.registerSingleton<NavigationService>(service);
//   return service;
// }
 
// AppDatabaseMock getAndRegisterAppDatabaseMock({bool returnAddress:false}) {
//   _removeRegistrationIfExists<Database>();
//   var database = AppDatabaseMock();
//   locator.registerSingleton<Database>(database);
   
//    //stubbing 
//   when(database.getCurrentAddress()).thenAnswer((realInvocation) {
//     if (returnAddress) return Future.value(Address());
//     return null;
//   });
//   return database;
// }
// //This function will check if the type is registered. If it is registered it will unregister it from the locator.
// void _removeRegistrationIfExists<T>() {
//   if (locator.isRegistered<T>()) {
//     locator.unregister<T>();
//   }
// }
// void registerServices() {
//   getAndRegisterSharedPreferencesMock();
//   getAndRegisterNavigationServiceMock();
//   getAndRegisterAppDatabaseMock();
// }

// void unregisterServices() {
//   locator.unregister<SharedPreferencesService>();
//   locator.unregister<NavigationService>();
//     locator.unregister<Database>();

// }