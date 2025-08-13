import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:greeny_app/data/cart_items.dart';
import 'package:greeny_app/features/home/models/product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveFromCartEvent>(removeFromCartEvent);
    on<CartNavToPaymentPageEvent>(cartNavToPaymentPageEvent);
    on<ClearCartEvent>(clearCartEvent);
  }

  FutureOr<void> cartInitialEvent(
    CartInitialEvent event,
    Emitter<CartState> emit,
  ) {
    if (cartItems.isEmpty) {
      emit(CartEmptyState());
    } else {
      emit(CartSuccessState(cartItems: cartItems));
    }
  }

  FutureOr<void> removeFromCartEvent(
    RemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) {
    cartItems.remove(event.productDataModel);
    if (cartItems.isEmpty) {
      emit(CartItemRemovedState());
      emit(CartEmptyState());
    } else {
      emit(CartItemRemovedState());
      emit(CartSuccessState(cartItems: cartItems));
    }
  }

  FutureOr<void> cartNavToPaymentPageEvent(
    CartNavToPaymentPageEvent event,
    Emitter<CartState> emit,
  ) {
    emit(CartNavToPaymentPageActionState());
  }

  FutureOr<void> clearCartEvent(ClearCartEvent event, Emitter<CartState> emit) {
    cartItems.clear();
    emit(CartEmptyState());
  }
}
