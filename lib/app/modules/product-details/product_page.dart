import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greengrocer/app/core/constants/theme_constants.dart';
import 'package:greengrocer/app/core/models/item_model.dart';
import 'package:greengrocer/app/core/utils/utils.dart';
import 'package:greengrocer/app/core/widgets/quantity_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  final ItemModel item;

  ProductDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final Utils utils = Utils();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(233),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagem
              Expanded(
                child: Hero(
                  tag: widget.item.imgUrl,
                  child: Image.asset(widget.item.imgUrl),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(255),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Nome - Quantidade
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          QuatityWidget(
                            suffixText: widget.item.unit,
                            value: cartItemQuantity,
                            result: (quantity) {
                              setState(() {
                                cartItemQuantity = quantity;
                              });
                            },
                          )
                        ],
                      ),

                      // Preço
                      Text(
                        utils.priceToCurrency(widget.item.price),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: ThemeConstants.customSwatchColor,
                        ),
                      ),
                      // Descrição
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description,
                              style: const TextStyle(height: 1.5),
                            ),
                          ),
                        ),
                      ),

                      // Botão
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {},
                          label: const Text(
                            'Adicionar no carrinho',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Modular.to.navigate('/base/');
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
