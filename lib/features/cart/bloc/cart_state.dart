part of 'cart_bloc.dart';

@immutable
sealed class CartState {} // Build the UI

abstract class CartActionState extends CartState {} // Action State

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}

// Remove
class CartItemRemovedState extends CartActionState {}

// Empty state
class CartEmptyState extends CartState {}

// Error state
class CartErrorState extends CartState {
  final String message;
  CartErrorState(this.message);
}

// Navigate to Paymrnt page
class CartNavToPaymentPageActionState extends CartActionState {}
