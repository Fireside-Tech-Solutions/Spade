import 'dart:async';

import 'package:meta/meta.dart';
import 'package:spades/services/firestore_path.dart';
import 'package:spades/services/firestore_service.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase {
  FirestoreDatabase({@required this.uid})
      : assert(uid != null, 'Cannot create FirestoreDatabase with null uid');
  final String uid;

  final _service = FirestoreService.instance;
}