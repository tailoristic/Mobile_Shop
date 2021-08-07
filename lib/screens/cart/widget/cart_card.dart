import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/data/constants/size_constants.dart';
import 'package:shopping_cart/data/models/product_model.dart';
import 'package:shopping_cart/data/theme/app_theme.dart';
import 'package:shopping_cart/widgets/custom_button.dart';

class CartCard extends StatelessWidget {
  final ProductModel productModel;
  final VoidCallback onRemove;
  const CartCard({
    Key key,
    @required this.productModel,
    @required this.onRemove,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(SizeConstant.kDefaultPadding),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xFF515764),
        boxShadow: [
          const BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 23,
            spreadRadius: -13,
            color: AppTheme.kShadowColor,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 120.0,
            width: 120.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: productModel.image,
                fit: BoxFit.cover,
                memCacheHeight: 620,
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.name,
                  style: TextStyle(
                    color: AppTheme.kWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "₹ " + productModel.price,
                  style: TextStyle(
                    color: AppTheme.kWhite,
                    fontSize: 17.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  title: "Delete",
                  textSize: 16.0,
                  height: 35.0,
                  width: 80.0,
                  onTap: onRemove,
                  isLoading: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
