part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesState {} // Build the UI

abstract class FavActionState extends FavoritesState {} // Action State

final class FavoritesInitial extends FavoritesState {}

class FavSuccessState extends FavoritesState {
  final List<ProductDataModel> favItems;

  FavSuccessState({required this.favItems});
}

// Remove
class FavItemRemovedState extends FavActionState {}
