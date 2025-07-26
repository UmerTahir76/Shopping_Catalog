# ecomm_flutter
Track #3 : SHopping Cata;log App in flutter

# Flutter eCommerce App

A simple and clean eCommerce mobile application built with **Flutter** that fetches products from a public API (`fakestoreapi.com`) and displays them in a beautiful UI with cart and product detail functionalities.

---

## Features

- **Home Page**: Fetch and display live products using API.
- **Cart System**: Add to cart and remove from cart functionalities.
- **Product Details**: View each product's image, price, and description.
- **Bottom Navigation**: Navigate between Home, Cart.
- **State Management**: Implemented using `Provider`.
- **API Integration**: Used `http` package to fetch data from FakeStore API.
- **Clean UI**: User-friendly and aesthetic design using Flutter widgets.

---

## Tech Stack

- **Flutter** (UI Framework)
- **Dart** (Language)
- **HTTP** (for API requests)
- **Provider** (for state management)

---

## Project Structure  check from the code 

## Fetch Product operation

  Future<void> fetchProducts() async {
    final url = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      products = jsonData.map((e) => Product.fromJson(e)).toList();
    } else {
      // Handle error
      print("Failed to fetch products");
    }

    setState(() {
      isLoading = false;
    });
  }

## Cart Logic
void addItemToCart(Product product) {
  _userCart.add(product);
  notifyListeners();
}

void removeItemFromCart(Product product) {
  _userCart.remove(product);
  notifyListeners();
}





- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
