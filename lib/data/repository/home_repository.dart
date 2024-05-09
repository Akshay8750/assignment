import 'package:assignment/data/models/carousel_model.dart';
import 'package:assignment/data/models/category_model.dart';
import 'package:assignment/data/models/home_banner_model.dart';
import 'package:assignment/data/models/product_model.dart';
import 'package:assignment/data/models/sponsor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    QuerySnapshot querySnapshot = await _firestore.collection('categories').get();
    return querySnapshot.docs
        .map((doc) => CategoryModel.fromJson(doc.data() as Map<String, dynamic>? ?? {}))
        .toList();
  }

  Future<List<ProductModel>> getAllProducts() async {
    QuerySnapshot querySnapshot = await _firestore.collection('products').get();
    return querySnapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>? ?? {}))
        .toList();
  }


  Future<List<CarouselModel>> getCarouselData() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('banners/carousel/home_carousel').get();
    return querySnapshot.docs
        .map((doc) => CarouselModel.fromJson(doc.data() as Map<String, dynamic>? ?? {}))
        .toList();
  }

  Future<List<HomeBannerModel>> getHomeBanners() async {
    QuerySnapshot querySnapshot = await _firestore.collection('banners/banners/home_banners').get();
    return querySnapshot.docs
        .map((doc) => HomeBannerModel.fromJson(doc.data() as Map<String, dynamic>? ?? {}))
        .toList();
  }

  Future<SponsorModel> getSponsorData() async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('banners').doc('sponserd').get();
    if (documentSnapshot.exists) {
      return SponsorModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception('Sponsor document does not exist');
    }
  }
}
