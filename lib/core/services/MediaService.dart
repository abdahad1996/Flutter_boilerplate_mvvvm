// "when do I create a service"?

// When you want to abstract third party packages from your code base
// When you have a set of features that can be grouped together (S from the SOLID principles)
// When you want to share functionality between ViewModels


//the business logic should be pure for multiple reasons but 2 ones that I think are important are.

// So that you can UNIT test it
// To ensure even when the package is swapped out you're not concerned about side effects in your business logic.
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
//Abstract Third Party Packages Through a Service
@lazySingleton
class MediaService {
  Future<PickedFile> getImage(bool fromGallery) {
    return ImagePicker().getImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera);
  }
}
