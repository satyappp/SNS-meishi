import 'package:hive/hive.dart';

part 'SNSInfo.g.dart';

@HiveType(typeId: 0)
class SNSInfo {
  @HiveField(0)
  String name;

  @HiveField(1)
  String url;

  @HiveField(2)
  String icon;

  @HiveField(3)
  String iconType;

  SNSInfo(
      {required this.name,
      required this.url,
      required this.icon,
      required this.iconType});
}
