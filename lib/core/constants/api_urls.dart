class API_URL{
  static const String root="http://152.53.32.75:8000/api";
  static const String allProductsUrl="$root/product"; 
  static const String lookup="$root/lookup";
  static const String reasonsLookup="$lookup/contribution-reasons";
  static const String sourcesLookup="$lookup/contribution-sources";
  static const String productByBarcode="$allProductsUrl/barcode/";
  static const String vote="contribute";
  static const String searchByName="$allProductsUrl?searchTerm=";

}