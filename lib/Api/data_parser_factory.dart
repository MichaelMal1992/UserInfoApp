import '../Models/user_model.dart';

abstract class DataParser<T> {
  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}

class DataParserFactory {
  static DataParser<T> getParser<T>() {
    if (T == UserModel) {
      return const UserModel() as DataParser<T>;
    } else {
      throw ArgumentError('DataParser not found for type: $T');
    }
  }
}
