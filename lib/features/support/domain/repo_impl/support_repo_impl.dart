// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../data/model/msg.dart';
// import '../../data/repo/support_repo.dart';

// class SupportRepoImpl implements SupportRepo {
//   final FirebaseFirestore firestore;
//   SupportRepoImpl({
//     required this.firestore,
//   });

//   @override
//   Future<List<Msg>> getMsgs({
//     required int chatId,
//   }) async {
//     try {
//       final querySnapshot = await firestore
//           .collection('chats')
//           .doc('chat_id')
//           .collection('messages')
//           .get();
//       return querySnapshot.docs.map((doc) => Msg.fromJson(doc.data())).toList();
//     } catch (error) {
//       throw Exception(
//         'Error fetching messages',
//       );
//     }
//   }

//   @override
//   Future<void> sendMsg({
//     required Msg msg,
//   }) async {
//     try {
//       await firestore
//           .collection('chats')
//           .doc('chat_id')
//           .collection('messages')
//           .add(
//         {
//           // 'content': msg.content,
//           // 'senderId': msg.senderId,
//           'timestamp': FieldValue.serverTimestamp(),
//         },
//       );
//     } catch (e) {
//       throw Exception('Error sending message');
//     }
//   }
// }
