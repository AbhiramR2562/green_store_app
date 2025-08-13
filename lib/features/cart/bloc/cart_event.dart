part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class RemoveFromCartEvent extends CartEvent {
  final ProductDataModel productDataModel;

  RemoveFromCartEvent({required this.productDataModel});
}

// Navigate to payment page
class CartNavToPaymentPageEvent extends CartEvent {}

// CLear Cart
class ClearCartEvent extends CartEvent {}
