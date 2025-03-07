import 'package:flutter_test/flutter_test.dart';
import 'package:t_shirt_calculator/shirt_calculator.dart'; // ✅ Importamos la lógica desde lib/

void main() {
  group('ShirtCalculator', () {
    test('calculaPreuSamarretes', () {
      expect(ShirtCalculator.calculaPreuSamarretes(10, 'Small'), 7.99 * 10);
      expect(ShirtCalculator.calculaPreuSamarretes(10, 'Medium'), 9.95 * 10);
      expect(ShirtCalculator.calculaPreuSamarretes(10, 'Large'), 13.50 * 10);
    });

    test('calculaDescompte', () {
      expect(ShirtCalculator.calculaDescompte(100, 1), 100 * 0.10);
      expect(ShirtCalculator.calculaDescompte(150, 2), 20);
      expect(ShirtCalculator.calculaDescompte(50, 2), 0);
    });

    test('preuDefinitiu', () {
      expect(ShirtCalculator.preuDefinitiu(10, 'Small', 0), 7.99 * 10);
      expect(ShirtCalculator.preuDefinitiu(10, 'Small', 1), (7.99 * 10) * 0.9);
      expect(ShirtCalculator.preuDefinitiu(10, 'Large', 2), (13.50 * 10) - 20);
    });
  });
}
