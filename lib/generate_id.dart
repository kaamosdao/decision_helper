import 'package:uuid/uuid.dart';

var uuid = const Uuid();

String generateId() => uuid.v1();
