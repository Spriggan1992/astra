import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:astra_app/domain/applicant/applicant.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/search/repositories/i_search_repository.dart';
import 'package:injectable/injectable.dart';

/// Defines the implementation of the api service to list of applicants.
@LazySingleton(as: ISearchRepository)
class SearchRepository extends ISearchRepository {
  ///Dio client
  final Dio _dio;

  SearchRepository(this._dio);

  @override
  Future<Either<AstraFailure, List<Applicant>>> getApplicants() async{
     try{
       final _applicants =  Applicant.getApplicants(); 
       return right(_applicants); 
     }catch(e){
       return left(const AstraFailure.api(100)); 
     }
  }
}
