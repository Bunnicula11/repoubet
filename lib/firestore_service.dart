import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ✅ Use your fixed document ID from Firestore
  final String settingsDocId = 'ZAdKALW38ZYDKP9TiQ0U';

  /// 🔹 Update sensitivity level
  Future<void> updateSensitivity(int sensitivityLevel) async {
    await _db.collection('settings').doc(settingsDocId).update({
      'sensitivity_level': sensitivityLevel,
      'updated_at': FieldValue.serverTimestamp(),
    });
  }

  /// 🔹 Get current sensitivity level
  Future<int> getSensitivity() async {
    final doc = await _db.collection('settings').doc(settingsDocId).get();
    if (doc.exists && doc.data()!.containsKey('sensitivity_level')) {
      return doc['sensitivity_level'] as int;
    } else {
      return 5; // default fallback
    }
  }

  /// 🔹 Update threshold value
  Future<void> updateThreshold(double thresholdValue) async {
    await _db.collection('settings').doc(settingsDocId).update({
      'threshold_value': thresholdValue,
      'updated_at': FieldValue.serverTimestamp(),
    });
  }

  /// 🔹 Get threshold value
  Future<double> getThreshold() async {
    final doc = await _db.collection('settings').doc(settingsDocId).get();
    if (doc.exists && doc.data()!.containsKey('threshold_value')) {
      return (doc['threshold_value'] as num).toDouble();
    } else {
      return 60.0; // default fallback
    }
  }

  /// 🔹 Toggle alert (enable/disable)
  Future<void> setAlertEnabled(bool enabled) async {
    await _db.collection('settings').doc(settingsDocId).update({
      'alert_enabled': enabled,
      'updated_at': FieldValue.serverTimestamp(),
    });
  }

  /// 🔹 Check if alert is enabled
  Future<bool> isAlertEnabled() async {
    final doc = await _db.collection('settings').doc(settingsDocId).get();
    if (doc.exists && doc.data()!.containsKey('alert_enabled')) {
      return doc['alert_enabled'] as bool;
    } else {
      return true; // default to true
    }
  }

  /// 🔹 Add new alert record
  Future<void> addAlert({
    required double soundLevel,
  }) async {
    await _db.collection('alerts').add({
      'user_id': settingsDocId, // or actual user id if later added
      'sound_level': soundLevel,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  /// 🔹 Stream real-time alerts
  Stream<QuerySnapshot> getAlerts() {
    return _db
        .collection('alerts')
        .where('user_id', isEqualTo: settingsDocId)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
