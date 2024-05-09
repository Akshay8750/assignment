import 'package:assignment/data/models/carousel_model.dart';
import 'package:assignment/data/models/category_model.dart';
import 'package:assignment/data/models/home_banner_model.dart';
import 'package:assignment/data/models/product_model.dart';
import 'package:assignment/data/models/sponsor_model.dart';
import 'package:assignment/data/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository = Get.find<HomeRepository>();
  final categories = RxList<CategoryModel>();
  final allProducts = RxList<ProductModel>();
  final dealOfTheDayProducts = RxList<ProductModel>();
  final trendingProducts = RxList<ProductModel>();
  final carouselData = RxList<CarouselModel>();
  final sponsorData = Rx<SponsorModel?>(null);
  final midBanner = Rx<HomeBannerModel?>(null);
  final bottomBanner = Rx<HomeBannerModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchProducts();
    fetchCarouselData();
    fetchBannerData();
    fetchSponsorData();
  }

  void fetchCategories() async {
    categories.value = await _homeRepository.getCategories();
  }

  void fetchProducts() async {
    allProducts.value = await _homeRepository.getAllProducts();
    dealOfTheDayProducts.value =
        allProducts.where((element) => element.isDealOfTheDay == true).toList();
    trendingProducts.value = allProducts.where((element) => element.isTrending == true).toList();
  }

  void fetchCarouselData() async {
    carouselData.value = await _homeRepository.getCarouselData();
  }

  void fetchBannerData() async {
    var list = await _homeRepository.getHomeBanners();
    midBanner.value = list.firstWhere((element) => element.position == "home_mid");
    bottomBanner.value = list.firstWhere((element) => element.position == "home_bottom");
  }

  void fetchSponsorData() async {
    sponsorData.value = await _homeRepository.getSponsorData();
  }
}
