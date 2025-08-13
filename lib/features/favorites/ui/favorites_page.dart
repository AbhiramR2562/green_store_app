import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greeny_app/features/favorites/bloc/favorites_bloc.dart';
import 'package:greeny_app/features/favorites/widgets/favorite_tile.dart';
import 'package:greeny_app/src/show_snackbar.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final FavoritesBloc favBloc = FavoritesBloc();

  @override
  void initState() {
    favBloc.add(FavInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Favorite page"), centerTitle: true),
      body: BlocConsumer<FavoritesBloc, FavoritesState>(
        bloc: favBloc,
        listenWhen: (previous, current) => current is FavActionState,
        buildWhen: (previous, current) => current is! FavActionState,
        listener: (context, state) {
          if (state is FavItemRemovedState) {
            showSnackBarMessage(context, "Item removed from favorites");
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case FavSuccessState:
              final successState = state as FavSuccessState;
              return ListView.builder(
                itemCount: successState.favItems.length,
                itemBuilder: (context, index) {
                  return FavoriteTile(
                    productDataModel: successState.favItems[index],
                    favBloc: favBloc,
                  );
                },
              );

            default:
          }
          return Container();
        },
      ),
    );
  }
}
