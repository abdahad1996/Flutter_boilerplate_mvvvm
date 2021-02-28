class InAppConstants {
  //If you are selling one-time subscription . However, we turned autoConsume off
  // , so the product can only be repurchased the purchase has been marked as consumed.
  //this is for andorid only

  static var kAutoConsume = true;
  static var kConsumableId = 'consumable';
  static var kProductIds = <String>[kConsumableId, 'upgrade', 'subscription'];
}
