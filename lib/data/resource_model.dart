import 'package:reactiv/reactiv.dart';

class ResourceData {
  static ReactiveList<ResourceModel> data = ReactiveList<ResourceModel>([]);
}

class ResourceModel {
  String title;
  String details;

  ResourceModel({required this.title, required this.details});
}
