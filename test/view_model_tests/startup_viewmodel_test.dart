// // import 'package:Practice_Stacked/App/Router.gr.dart';
// // import 'package:Practice_Stacked/UI/pages/startUp/startup_viewmodel.dart';
// import 'package:Practice_Stacked/App/Router.gr.dart';
// import 'package:Practice_Stacked/ui/views/examples/startup/startup_viewmodel.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// // import 'package:my_app/app/router.gr.dart';
// // import 'package:my_app/ui/views/startup/startup_viewmodel.dart';

// import '../setup/test_helpers.dart';

// void main() {
//   group('StartupViewmodelTest -', () {
//     // setUp(() => registerServices());
//     // tearDown(() => unregisterServices());

//     setUp(() => registerServices());
//     tearDown(() => unregisterServices());

//     group('initialise -', () {
//       test('When called should check hasUser on sharedPreferences', () async {
//         var sharedPreferences = getAndRegisterSharedPreferencesMock();
//         var model = StartupViewModel();
//         await model.initialise();
//         verify(sharedPreferences.hasUser);
//       });
//     });

//     // test(
//     //     'When called and hasUser returns true, should call replaceWith Routes.homeViewRoute',
//     //     () async {
//     //   var navigationService = getAndRegisterNavigationServiceMock();
//     //   var model = StartUpViewModel();
//     //   await model.initialise();
//     //   verify(navigationService.replaceWith(Routes.homeView));
//     // });

//      test(
//     'When called and hasUser returns true, should get currentAddress from disk',
//     () async {
//   var database = getAndRegisterAppDatabaseMock();
//   var model = StartupViewModel();
//   await model.initialise();
//   verify(database.getCurrentAddress());
// });
//  test(
//         'When hasUser is true and getCurrentAddress returns null, should navigate to addressSelectionViewRoute',
//         () async {
//       getAndRegisterAppDatabaseMock(returnAddress: false);
//       var navigation = getAndRegisterNavigationServiceMock();
//       var model = StartupViewModel();
//       await model.initialise();
//       verify(navigation.replaceWith(Routes.addressSelectionView));
//     });
    
//     });
   
// }
