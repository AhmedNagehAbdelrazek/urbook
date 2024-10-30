import 'package:flutter_bloc/flutter_bloc.dart';
part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());
}
