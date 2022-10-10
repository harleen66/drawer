import 'package:drawer/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.purpleAccent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl4.make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not suppoted yet.".text.make()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 220, 110, 216))),
                  child: "Buy".text.white.make())
              .w32(context)
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  // _cart.remove(_cart.items[index]);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: "Not Removed Item".text.xl2.make(),
                    ),
                  );
                  setState(() {});
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
