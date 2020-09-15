import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth.dart';
import 'dart:math';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final AuthManager authManager = AuthManager();
Map<String, String> userMap = {'user': authManager.getUID()};

///There are 4 collections inside the database, 'listener_users': users who chose
///to be a listener, 'venter_users': users who chose to be a venter (to vent in
///the chat), 'active_users': users who are currently in-chat, 'idle_users': users
///who are simply in the app and don't fit in the other groups.
///Each document inside of those collections are named after the UID of the user
///and the documents contain the UID of the user.
class DatabaseManager {
  getUserRole() async {
    String userRole;

    ///The documents inside of the collections of the users have the UID as the
    ///name of the document, as in: if the UID is 1234abc then the database would
    ///look like: 'listener_users'->'1234abc'->"'user': '1234abc'"
    ///               ^collection    ^document    ^data inside the document
    final snapshot = await _firestore
        .collection('listener_users')
        .doc(authManager.getUID())
        .get();

    snapshot.exists ? userRole = 'listener' : userRole = 'venter';
    print('userRole = ' + userRole);
    return userRole;
  }

  createAChatRoomID() async {
    var secondUser;
    var userRole = await getUserRole();
    String id;

    ///We are looking to make the chat room ID look in this format:
    ///'listenerUID_venterUID' so if the current user role is 'listener', then
    ///we need to get a random venter, and make the chat room ID look like this:
    ///'currentUserUID_secondUserUID', and the opposite.

    if (userRole == 'listener') {
      secondUser = await getARandomVenter();
      id = "${authManager.getUID()}_$secondUser";
    } else if (userRole == 'venter') {
      secondUser = await getARandomListener();
      id = "${secondUser}_${authManager.getUID()}";
    }
    if (secondUser == null) id = 'noUsers';
    return id;
  }

  ///These functions add the current user to their respective group.
  addUserToListener() async {
    await _firestore
        .collection('listener_users')
        .doc(authManager.getUID())
        .set(userMap);
  }

  addUserToVenter() async {
    await _firestore
        .collection('venter_users')
        .doc(authManager.getUID())
        .set(userMap);
  }

  addUserToActive() async {
    await _firestore
        .collection('active_users')
        .doc(authManager.getUID())
        .set(userMap);
  }

  addUserToIdle() async {
    await _firestore
        .collection('idle_users')
        .doc(authManager.getUID())
        .set(userMap);
  }

  ///These functions remove the current user from their respective group.
  removeUserFromListener() async {
    await _firestore
        .collection("listener_users")
        .doc(authManager.getUID())
        .delete();
  }

  removeUserFromVenter() async {
    await _firestore
        .collection('venter_users')
        .doc(authManager.getUID())
        .delete();
  }

  removeUserFromActive() async {
    await _firestore
        .collection('active_users')
        .doc(authManager.getUID())
        .delete();
  }

  removeUserFromIdle() async {
    await _firestore
        .collection('idle_users')
        .doc(authManager.getUID())
        .delete();
  }

  getARandomVenter() async {
    ///Taps into the 'venter_users' collection.
    QuerySnapshot querySnapshot =
        await _firestore.collection('venter_users').get();

    ///receive the documents inside of the 'venter_users' collection as a list
    ///and gets saved in the 'docs' variable.
    List<DocumentSnapshot> docs = querySnapshot.docs;

    ///chooses a random index between 0 and the length of the list 'docs'.
    ///Therefore, it's a random document/user from the overall documents in the
    ///collection.
    print("docs.length: ${docs.length}");
    if (docs.length != 0) {
      DocumentSnapshot randomDocument = docs[Random().nextInt(docs.length)];
      if (randomDocument != null) return randomDocument.id;

      ///return the user UID.
    }
  }

  getARandomListener() async {
    ///Taps into the 'listener_users' collection.
    QuerySnapshot querySnapshot =
        await _firestore.collection('listener_users').get();

    ///receive the documents inside of the 'listener_users' collection as a list
    ///and gets saved in the 'docs' variable.
    List<DocumentSnapshot> docs = querySnapshot.docs;

    ///chooses a random index between 0 and the length of the list 'docs'.
    ///Therefore, it's a random document/user from the overall documents in the
    ///collection.
    if (docs.length > 0) {
      DocumentSnapshot randomDocument = docs[Random().nextInt(docs.length)];
      if (randomDocument != null) return randomDocument.id;

      ///return the user UID.
    }
  }
}
