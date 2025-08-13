import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:greeny_app/data/favorites_items.dart';
import 'package:greeny_app/features/home/models/product_data_model.dart';
import 'package:meta/meta.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<FavInitialEvent>(favInitialEvent);
    on<RemoveFromFavEvent>(removeFromFavEvent);
  }

  FutureOr<void> favInitialEvent(
    FavInitialEvent event,
    Emitter<FavoritesState> emit,
  ) {
    emit(FavSuccessState(favItems: favItems));
  }

  FutureOr<void> removeFromFavEvent(
    RemoveFromFavEvent event,
    Emitter<FavoritesState> emit,
  ) {
    favItems.remove(event.productDataModel);
    emit(FavItemRemovedState());
    emit(FavSuccessState(favItems: favItems));
  }
}
