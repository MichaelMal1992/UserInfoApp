import '../Api/api_client.dart';

class DataRepository {
  final ApiClient apiClient;

  const DataRepository({required this.apiClient});

  Future<List<T>> getData<T>(String endpoint) {
    return apiClient.fetchData<T>(endpoint);
  }
}
