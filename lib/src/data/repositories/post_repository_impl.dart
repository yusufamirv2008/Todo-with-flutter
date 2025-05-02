// import 'package:alif_academy/src/core/error/failures.dart';
// import '../../domain/entities/post.dart';
// import '../../domain/repositories/post_repository.dart';
// import '../datasources/post_remote_data_source.dart';

// class PostRepositoryImpl implements PostRepository {
//   final PostRemoteDataSource remoteDataSource;

//   PostRepositoryImpl(this.remoteDataSource);

//   @override
//   Future<Either<Failure, List<Post>>> getPostsByUser(int userId) async {
//     try {
//       final posts = await remoteDataSource.getPostsByUser(userId);
//       return Right(posts);
//     } catch (_) {
//       return Left(ServerFailure());
//     }
//   }
// }
