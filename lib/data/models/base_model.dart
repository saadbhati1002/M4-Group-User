/// Base model class for data layer
abstract class BaseModel {
  const BaseModel();

  Map<String, dynamic> toJson();
}
