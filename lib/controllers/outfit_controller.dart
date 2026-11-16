import 'package:android/data/repositories/outfits/outfit_repository.dart';
import 'package:android/domain/models/clothes/cloth.dart';
import 'package:android/domain/models/clothes/cloth_page.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OutfitController {
  final OutfitRepository repository;

  OutfitController(this.repository);

  // final int _pageSize = 10;
  //
  // final PagingController<int, Cloth> _pagingController = PagingController(
  //   getNextPageKey: (state) => (state.keys?.last ?? 0) + 1, 
  //   fetchPage: (pageKey) => getCloth(pageKey, _pageSize));

  Future<Cloth> getCloth(String category) async {
      final cloth = await repository.getCloth(category);
      //bisa nambahin bussiness logic di sini
      return cloth;
    }

  Future<Cloth> getClothById(String id) async {
      final cloth = await repository.getClothById(id);
      return cloth;
    }
  
  Future<Cloth> searchCloth(String category, String keyword) async {
      final cloth = await repository.getCloth(category);
      //bisa nambahin bussiness logic di sini
      return cloth;
    }

  Future<ClothPage> getClothPaginate(
    String category, {
    int page = 1,
  }) async {
    final cloth = await repository.getClothPaginate(
      category,
      page: page,
    );
    return cloth;
  }
}
