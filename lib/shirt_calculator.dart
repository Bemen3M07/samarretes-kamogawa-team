class ShirtCalculator {
  static const double small = 7.99;
  static const double medium = 9.95;
  static const double large = 13.50;

  static double calculaPreuSamarretes(int numero, String talla) {
    double pricePerShirt;
    switch (talla) {
      case 'Small':
        pricePerShirt = small;
        break;
      case 'Medium':
        pricePerShirt = medium;
        break;
      case 'Large':
        pricePerShirt = large;
        break;
      default:
        throw ArgumentError('Talla no válida');
    }
    return pricePerShirt * numero;
  }

  static double calculaDescompte(double preu, int tipusDescompte) {
    double discount = 0;
    if (tipusDescompte == 1) {
      discount = preu * 0.10;  // Descuento del 10%
    } else if (tipusDescompte == 2 && preu >= 100) {
      discount = 20.0;  // Descuento de 20€ si el precio es >= 100€
    }
    return discount;
  }

  static double preuDefinitiu(int numero, String talla, int descompte) {
    double price = calculaPreuSamarretes(numero, talla);
    double discount = calculaDescompte(price, descompte);
    return price - discount;
  }
}
