import 'package:flutter_riverpod/flutter_riverpod.dart';

// Instead of String you can use other data types as well,
// we can also use custom data types.
final userNameProvider = StateProvider<String>((ref) {
  // we can also return an empty String here, for the sake of simplicity,
  //  let's return a sample name
  return "SomeName";
});
