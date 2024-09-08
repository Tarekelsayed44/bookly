import 'package:dartz/dartz.dart';
import '../../../../Core/errors/failures.dart';
import '../model/BookModel.dart';

abstract class HomeRepo{
 Future<Either<Failure,List<BookModel>>> fetchNewestBooks();
 Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
 Future<Either<Failure,List<BookModel>>> fetchSimilarBooks({required String category});
}