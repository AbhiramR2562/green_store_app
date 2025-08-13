import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greeny_app/features/cart/bloc/cart_bloc.dart';
import 'package:greeny_app/features/payment/ui/payment_page.dart';
import 'package:greeny_app/features/cart/widgets/cart_tile.dart';
import 'package:greeny_app/src/show_snackbar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.green,
        title: Text("Cart page"),
        centerTitle: true,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartItemRemovedState) {
            showSnackBarMessage(context, "Item removed from cart");
          } else if (state is CartNavToPaymentPageActionState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentPage()),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartEmptyState:
              return Center(
                child: Text(
                  "No items in your cart",
                  style: TextStyle(color: Colors.grey),
                ),
              );

            case CartSuccessState:
              final successState = state as CartSuccessState;
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: successState.cartItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: CartTile(
                          productDataModel: successState.cartItems[index],
                          cartBloc: cartBloc,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 18,
                    child: GestureDetector(
                      onTap: () {
                        cartBloc.add(ClearCartEvent());
                        cartBloc.add(CartNavToPaymentPageEvent());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.99,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.green[800],
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Text(
                              "Proceed to Buy (${successState.cartItems.length} items)",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );

            default:
          }
          return Container();
        },
      ),
    );
  }
}
