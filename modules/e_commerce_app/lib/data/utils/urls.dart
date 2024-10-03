class Urls{
  static const String _baseUrl='https://ecommerce-api.codesilicon.com/api';
  static const String logInUrl='$_baseUrl/UserLogin/mrrabbilhasan@gmail.com';
  static const String sliderUrl='$_baseUrl/ListProductSlider';
  static const String catListUrl='$_baseUrl/CategoryList';
  static  String productListByRemark(String remark)=>'$_baseUrl/ListProductByRemark/$remark';
  static String productListByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String productDetailsByID(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';


}