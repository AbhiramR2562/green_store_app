part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

// Initial Event
class HomeInitialEvent extends HomeEvent {}

// favorites button clicked
class HomeFavBtnClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeFavBtnClickedEvent({required this.clickedProduct});
}

// Cart button clicked
class HomeCartBtnClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeCartBtnClickedEvent({required this.clickedProduct});
}

// Favorites Button navigation
class HomeFavBtnBNavEvent extends HomeEvent {}

// Cart button navigation
class HomeCartBtnNavEvent extends HomeEvent {}
