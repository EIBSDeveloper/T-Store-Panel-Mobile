import 'dart:io';

// import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';

import '../../../features/media/model/image_model.dart';

class MediaRepository extends GetxController {
  static MediaRepository get instance => Get.find();

  //Firebase Storage Instance
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Upload any Image using File
  Future<ImageModel> uploadImageFileInStorage(
      {required Uint8List file,
      required String path,
      required String imageName}) async {
    try {
      // Reference to the storage location
      final Reference ref = _storage.ref('$path/$imageName');
      // Upload file
      await ref.putBlob(file);
      // Get download URL
      final String downloadURL = await ref.getDownloadURL();
      // Fetch metadata
      final FullMetadata metadata = await ref.getMetadata();
      return ImageModel.fromFirebaseMetadata(
          metadata, path, imageName, downloadURL);
    } on FirebaseException catch (e) {
      throw e.message!;
    }
    // on SocketException catch (e) {
    //   throw e.message;
    // } on PlatformException catch (e) {
    //   throw e.message!;
    // } catch (e) {
    //   throw e.toString();
    // }
  }

  Future<String> uploadImageToFirebase(ImageModel image) async {
    try {
      final data = await _db.collection("Images").add(image.toJson());
      return data.id;
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    }
    // on PlatformException catch (e) {
    //   throw e.message!;
    // } catch (e) {
    //   throw e.toString();
    // }
  }

  /// Fetch Image from firebase based on media category and load count
  Future<List<ImageModel>> fetchImagesFromDatabase(
      MediaCategory mediaCategory, int loadCount) async {
    try {
      final querySnapshot = await _db
          .collection("Images")
          .where('mediaCategory', isEqualTo: mediaCategory.name.toString())
          .orderBy('createdAt', descending: true)
          .limit(loadCount)
          .get();
      return querySnapshot.docs.map((e) => ImageModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  /// Load more images from firebase database
  Future<List<ImageModel>> loadMoreImagesFromDatabase(
      MediaCategory mediaCategory,
      int loadCount,
      DateTime lastFetchedDate) async {
    try {
      final querySnapshot = await _db
          .collection("Images")
          .where('mediaCategory', isEqualTo: mediaCategory.name.toString())
          .orderBy('createdAt', descending: true)
          .startAfter([lastFetchedDate])
          .limit(loadCount)
          .get();
      return querySnapshot.docs.map((e) => ImageModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  /// Delete images from firebase database
  Future<void> deleteImageFromStorage(ImageModel image) async {
    try {
      _storage.ref(image.fullPath).delete();
      _db.collection("Images").doc(image.id).delete();
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
