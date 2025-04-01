import 'dart:math';

import 'package:clot_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUserData(String userId, Map<String, dynamic> userData) async {
    if (userId.isEmpty) {
      await firestore.collection('users').doc(userId).set(userData);
    } else {
      await firestore.collection('users').add(userData);
    }
  }
}
