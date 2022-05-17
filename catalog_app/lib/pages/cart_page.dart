import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(children: [
        //  we have to create _cartList Wideget.
        const _CartList().p32().expand(),
        const Divider(),
        //Divider widget is used to sepearte two widgets. It is horizontal line with padding on the either side.
        const _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //It is a object of that cart class.
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Total Price has been accessed through _cart object.
          '${_cart.totalPrice}'
              .text
              .xl5
              .color(context.theme.colorScheme.secondary)
              .make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying not supported yet".text.center.make(),
              ));
            },
            style: ButtonStyle(
                backgroundColor:
                    // MaterialStateProperty gives value that depends on the widget state like before changing state it's color is red and after changing state its color become red.
                    // .all assign same value for all the state.
                    MaterialStateProperty.all(MyTheme.darkBlusishColor)),
            child: 'Buy'.text.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  //It is a object of that cart class.
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    // List view is used to show information in vetical way and builder helps in smooth rendering.
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            //Accessing all the items present in that class through the object.
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                //LisTile is used to populate list view.
                // It has three things leading, trailing and title.
                // leading displays an icon right most part of list tile.
                leading: const Icon(Icons.done),
                //trailing displays an icon in the left most part of the list tile.
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    _cart.remove(_cart.items[index]);
                    setState(() {
                      
                    });
                  },
                ),
                // Gives text between leading and trailing icon
                title: _cart.items[index].name.text.make()));
  }
}
