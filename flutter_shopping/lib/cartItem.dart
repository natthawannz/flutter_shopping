import 'package:flutter/material.dart';
import 'package:shopping_cart/item.dart';

class CartItem extends StatelessWidget {
  final Item item;
  final ValueChanged<int> onQuantityChanged;

  const CartItem({
    Key? key,
    required this.item,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.name),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (item.amount > 0) {
                    onQuantityChanged(item.amount - 1);
                  }
                },
              ),
              Text('${item.amount}'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  onQuantityChanged(item.amount + 1);
                },
              ),
            ],
          ),
          Text('${(item.price * item.amount).toStringAsFixed(2)} ฿'),
        ],
      ),
    );
  }
}
