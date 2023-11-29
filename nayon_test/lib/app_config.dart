class AppConfig{
  //domain url
  static const String DOMAIN = "https://demo.alorferi.com";
  //api version
  static const String Api = "api";

  //base url
  static const String BASE_URL = "$DOMAIN/$Api";

  //login api

  static const String LOGIN = "${DOMAIN}/oauth/token";

  static const String PRODUCTS = "$BASE_URL/my-products";

}