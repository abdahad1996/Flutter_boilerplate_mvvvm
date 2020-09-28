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

 dialogService.registerCustomDialogUi(
    // variant: DialogType.Form,
     (BuildContext context, DialogRequest dialogRequest) => Dialog(
      child: _customDialogUi(dialogRequest,
            (dialogResponse) => dialogService.completeDialog(dialogResponse))
    ),
  );
}

//have as many dialogs as you want 
Widget _customDialogUi(
  DialogRequest dialogRequest,
  Function(DialogResponse) onDialogTap,
) {
  var dialogType = dialogRequest.customData as DialogType;
  switch (dialogType) {
    case DialogType.base:
      return _FormCustomDialog(
        dialogRequest: dialogRequest,
        onDialogTap: onDialogTap,
      );
    case DialogType.form:
    default:
      return _BasicCustomDialog(
        dialogRequest: dialogRequest,
        onDialogTap: onDialogTap,
      );
  }
}

class _BasicCustomDialog extends StatelessWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;
  const _BasicCustomDialog({Key key, this.dialogRequest, this.onDialogTap})
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
            dialogRequest.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            dialogRequest.description,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => onDialogTap(DialogResponse(confirmed: true)),
            child: Container(
              child: dialogRequest.showIconInMainButton
                  ? Icon(Icons.check_circle)
                  : Text(dialogRequest.mainButtonTitle),
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
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;
  const _FormCustomDialog({Key key, this.dialogRequest, this.onDialogTap})
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
            dialogRequest.title,
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
                onDialogTap(DialogResponse(responseData: [controller.text])),
            child: Container(
              child: dialogRequest.showIconInMainButton
                  ? Icon(Icons.check_circle)
                  : Text(dialogRequest.mainButtonTitle),
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