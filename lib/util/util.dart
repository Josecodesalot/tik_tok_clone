import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';

///getRandomNumber gets you a random number from a specific number (0 if null)
///up to a specific number
int getRandomNumber({@required int upTo, int from}) => Random().nextInt(upTo);

String firebasePushKey(String ref) {
  return FirebaseDatabase.instance.reference().child(ref).push().key;
}
