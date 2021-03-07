import 'package:BoilerPlateMVVM/core/App/locator.dart';
import 'package:BoilerPlateMVVM/enums/dialog_type.dart';
// import 'package:Practice_Stacked/App/locator.dart';
// import 'package:Practice_Stacked/enum/dialog_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_services/stacked_services.dart';

//The DialogService will show a platform-specific dialog by default.
// You can change this by passing in dialogPlatform to your show dialog call.
void setupDialogUi() {
  final dialogService = locator<DialogService>();

  // dialogService.registerCustomDialogBuilders(builders)
//  dialogService.registerCustomDialogBuilders(
//     // variant: DialogType.Form,
//      (BuildContext context, DialogRequest dialogRequest) => Dialog(
//       child: _customDialogUi(dialogRequest,
//             (dialogResponse) => dialogService.completeDialog(dialogResponse))
//     ),
//   );

  final builders = {
    DialogType.basic: (context, sheetRequest, completer) =>
    _BasicCustomDialog(request:sheetRequest ,completer: completer,),
    //  DialogType.form: (context, sheetRequest, completer) =>
    // _customDialogUi(sheetRequest, completer)
  };

  dialogService.registerCustomDialogBuilders(builders);
}

//have as many dialogs as you want
Widget _customDialogUi(
  DialogRequest request,
  Function(DialogResponse) completer,
) {
  var dialogType = request.variant as DialogType;
  switch (dialogType) {
    case DialogType.basic:
      return _BasicCustomDialog(
        request: request,
        completer: completer,
      );
    case DialogType.form:
    default:
      return _FormCustomDialog(
        request: request,
        completer: completer,
      );
  }
}

class _BasicCustomDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _BasicCustomDialog({Key key, this.request, this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            request.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            request.description,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => completer(DialogResponse(confirmed: true)),
            child: Container(
              child: request.showIconInMainButton
                  ? Icon(Icons.check_circle)
                  : Text(request.mainButtonTitle),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FormCustomDialog extends HookWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _FormCustomDialog({Key key, this.request, this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = useTextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            request.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () =>
                completer(DialogResponse(responseData: [controller.text])),
            child: Container(
              child: request.showIconInMainButton
                  ? Icon(Icons.check_circle)
                  : Text(request.mainButtonTitle),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
