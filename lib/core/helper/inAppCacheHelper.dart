import 'package:BoilerPlateMVVM/core/App/locator.dart';
import 'package:BoilerPlateMVVM/core/services/SharedPreferencesService.dart';

//only for consumable products
class InAppCacheHelper {
  static const String _kPrefKey = 'consumables';
  static Future<void> _writes = Future.value();

  final _sharedPreferences = locator<SharedPreferencesService>();

  /// Adds a consumable with ID `id` to the store.
  ///
  /// The consumable is only added after the returned Future is complete.
  Future<void> save(String id) {
    _writes = _writes.then((void _) => _doSave(id));
    return _writes;
  }

  /// Consumes a consumable with ID `id` from the store.
  ///
  /// The consumable was only consumed after the returned Future is complete.
  Future<void> consume(String id) {
    _writes = _writes.then((void _) => _doConsume(id));
    return _writes;
  }

  /// Returns the list of consumables from the store.
  Future<List<String>> load() async {
    final consumable = await _sharedPreferences.getFromDisk(_kPrefKey) ?? [];
    return consumable;
    // return (await SharedPreferences.getInstance()).getStringList(_kPrefKey) ??
    //     [];
  }

  Future<void> _doSave(String id) async {
    List<String> cached = await load();
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    cached.add(id);
    _sharedPreferences.saveToDisk(_kPrefKey, cached);
    // await prefs.setStringList(_kPrefKey, cached);
  }

  //use up
  Future<void> _doConsume(String id) async {
    List<String> cached = await load();
    cached.remove(id);
    return _sharedPreferences.saveToDisk(_kPrefKey, cached);
  }
}
