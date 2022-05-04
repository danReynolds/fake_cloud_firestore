import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore_with_metadata/fake_cloud_firestore_with_metadata.dart';
import 'package:test/test.dart';

extension ExtendedFirestore on FirebaseFirestore {
  DocumentReference<Map<String, dynamic>> userDocument(String id) {
    return collection('users').doc(id);
  }
}

void main() {
  test('extension methods', () async {
    final instance = FakeFirebaseFirestore();
    final doc = instance.userDocument('bob');
    await doc.set({'name': 'Bob'});
    expect((await instance.collection('users').doc('bob').get())['name'],
        equals('Bob'));
  });
}
