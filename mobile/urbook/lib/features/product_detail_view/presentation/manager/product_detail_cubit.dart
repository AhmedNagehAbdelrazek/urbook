
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_detail_state.dart';

class ProductDetailViewCubit extends Cubit<ProductDetailViewState> {
  ProductDetailViewCubit() : super(ProductDetailViewInitial());
}
