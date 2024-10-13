class Urls {
  static const String _baseUrl = 'https://ecommerce-api.codesilicon.com/api';
  static const String logInUrl = '$_baseUrl/UserLogin/mrrabbilhasan@gmail.com';
  static const String sliderUrl = '$_baseUrl/ListProductSlider';
  static const String catListUrl = '$_baseUrl/CategoryList';
  static const String readProfiletUrl = '$_baseUrl/ReadProfile';
  static const String createProfiletUrl = '$_baseUrl/CreateProfile';
  static const String createCartListUrl = '$_baseUrl/CreateCartList';

  static String productListByRemark(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';

  static String productListByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String productDetailsByID(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';

  static String emailUrl(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtpUrl(String email, int otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

}
