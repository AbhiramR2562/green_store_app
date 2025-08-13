part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesEvent {}

class FavInitialEvent extends FavoritesEvent {}

class RemoveFromFavEvent extends FavoritesEvent {
  final ProductDataModel productDataModel;

  RemoveFromFavEvent({required this.productDataModel});
}
