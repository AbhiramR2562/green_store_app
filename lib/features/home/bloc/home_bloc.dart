import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:greeny_app/data/cart_items.dart';
import 'package:greeny_app/data/favorites_items.dart';
import 'package:greeny_app/data/plant_data.dart';
import 'package:greeny_app/features/home/models/product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeFavBtnClickedEvent>(homeFavBtnClickedEvent);
    on<HomeCartBtnClickedEvent>(homeCartBtnClickedEvent);
    on<HomeFavBtnBNavEvent>(homeFavBtnBNavEvent);
    on<HomeCartBtnNavEvent>(homeCartBtnNavEvent);
  }

  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(
      HomeLoadedSuccessState(
        products: PlantData.plantProducts
            .map(
              (e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl'],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeFavBtnClickedEvent(
    HomeFavBtnClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    if (favItems.contains(event.clickedProduct)) {
      // remove if already in favorites
      favItems.remove(event.clickedProduct);
      emit(HomeProductRemovedFromFavState());
    } else {
      // add if not in favorite
      favItems.add(event.clickedProduct);
      emit(HomeProductAddToFavState());
    }
  }

  FutureOr<void> homeCartBtnClickedEvent(
    HomeCartBtnClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    cartItems.add(event.clickedProduct);
    emit(HomeProductAddToCartState());
  }

  FutureOr<void> homeFavBtnBNavEvent(
    HomeFavBtnBNavEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeNavToFavoritePageActionState());
  }

  FutureOr<void> homeCartBtnNavEvent(
    HomeCartBtnNavEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeNavToCartPageActionState());
  }
}
