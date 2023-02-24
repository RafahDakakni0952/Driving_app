

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseCRUD{
  Future addData ()async{
    final doc = FirebaseFirestore.instance.collection('').doc('');
    await doc.set({'name':'samer'});
  }

  Future readData ()async{
    final doc = FirebaseFirestore.instance.collection('').doc('');

    final snapshot = await doc.get();
    if(snapshot.exists){
      
    }
  }

  Future updateData ()async{
    final doc = FirebaseFirestore.instance.collection('').doc('');

    await doc.update({'name':'samer'});
  }

  Future deleteData ()async{
    final doc = FirebaseFirestore.instance.collection('').doc('');

    await doc.delete();
  }


  static Future addTest()async{
    try{
      final user = FirebaseAuth.instance.currentUser!;
      final doc = FirebaseFirestore.instance.collection('Bookings').doc('${user.email}');

      await doc.set(
          {
            'email': user.email,
            'date': DateTime.now().add(const Duration(hours: 24)),
          }
      );
    }catch(e){
      print(e);
    }
}



}