part of 'home_bloc.dart';

@immutable
sealed class HomeState {} // Build the UI

abstract class HomeActionState extends HomeState {} // Action State

final class HomeInitial extends HomeState {}

// Loadiing
class HomeLoadingState extends HomeState {}

// Success state
class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

// error
class HomErrorState extends HomeState {}

// Navigate to Favorites page
class HomeNavToFavoritePageActionState extends HomeActionState {}

// Navigate to Cart Page
class HomeNavToCartPageActionState extends HomeActionState {}

// Add to the favorite
class HomeProductAddToFavState extends HomeActionState {}

// Remove fro favorite
class HomeProductRemovedFromFavState extends HomeActionState {}

// Add to Cart
class HomeProductAddToCartState extends HomeActionState {}
