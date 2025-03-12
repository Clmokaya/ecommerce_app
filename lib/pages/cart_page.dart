import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/Shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    //show a dialog box to ask user to remove from cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(
                'Remove this item from your cart?',
              ),
              actions: [
                //cancel
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                //yes button
                MaterialButton(
                  onPressed: () {
                    //pop dialog box
                    Navigator.pop(context);

                    //add to cart
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: Text('Yes'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart

    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text('Cart Page')),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart list
          Expanded(
              child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    //get individual item in  cart
                    final item = cart[index];
                    //return as a cart title UI
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => removeItemFromCart(context, item),
                      ),
                    );
                  }))
          //pay button
        ],
      ),
    );
  }
}
