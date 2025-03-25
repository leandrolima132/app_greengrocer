import 'package:flutter/material.dart';
import 'package:greengrocer/app/core/constants/theme_constants.dart';
import 'package:greengrocer/app/core/models/cart_item_model.dart';
import 'package:greengrocer/app/core/utils/utils.dart';
import 'package:greengrocer/app/core/widgets/quantity_widget.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;
  final VoidCallback onQuantityUpdate;

  const CartTile({
    Key? key,
    required this.cartItem,
    required this.remove,
    required this.onQuantityUpdate,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        // Imagem
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        // Titulo
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        // Total
        subtitle: Text(
          utils.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ThemeConstants.customSwatchColor,
          ),
        ),

        // Quantidade
        trailing: QuatityWidget(
          value: widget.cartItem.quantity,
          suffixText: widget.cartItem.item.unit,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;

              if (quantity == 0) {
                // Remover item do carrinho
                widget.remove(widget.cartItem);
              }
              widget.onQuantityUpdate();
            });
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
