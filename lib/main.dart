import 'package:flutter/material.dart';
import 'shirt_calculator.dart'; // ✅ Importamos la lógica

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShirtPriceCalculator(),
    );
  }
}

class ShirtPriceCalculator extends StatefulWidget {
  @override
  _ShirtPriceCalculatorState createState() => _ShirtPriceCalculatorState();
}

class _ShirtPriceCalculatorState extends State<ShirtPriceCalculator> {
  int _shirtCount = 0;
  String? _selectedSize;
  int _selectedDiscount = 0;
  double _totalPrice = 0;

  void _calculatePrice() {
    if (_shirtCount > 0 && _selectedSize != null) {
      setState(() {
        _totalPrice = ShirtCalculator.preuDefinitiu(_shirtCount, _selectedSize!, _selectedDiscount);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T-shirt Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter Number of Shirts:'),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _shirtCount = int.tryParse(value) ?? 0;
                });
                _calculatePrice();
              },
            ),
            SizedBox(height: 20),
            Text('Select Size:'),
            Column(
              children: ['Small', 'Medium', 'Large'].map((size) {
                return Row(
                  children: [
                    Radio<String>(
                      value: size,
                      groupValue: _selectedSize,
                      onChanged: (value) {
                        setState(() {
                          _selectedSize = value;
                        });
                        _calculatePrice();
                      },
                    ),
                    Text(size),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('Select Discount:'),
            DropdownButton<int>(
              value: _selectedDiscount,
              onChanged: (value) {
                setState(() {
                  _selectedDiscount = value!;
                });
                _calculatePrice();
              },
              items: [
                DropdownMenuItem(value: 0, child: Text('No Discount')),
                DropdownMenuItem(value: 1, child: Text('10% Off')),
                DropdownMenuItem(value: 2, child: Text('20€ Off Orders > 100€')),
              ],
            ),
            SizedBox(height: 20),
            if (_shirtCount > 0 && _selectedSize != null)
              Text(
                'Total Price: \$${_totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
          ],
        ),
      ),
    );
  }
}
