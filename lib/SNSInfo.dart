import 'package:hive/hive.dart';
part 'SNSInfo.g.dart';

@HiveType(typeId: 1)
class SNSInfo {
  @HiveField(0)
  String name;

  @HiveField(1)
  String url;

  @HiveField(2)
  String icon;

  SNSInfo({required this.name, required this.url,required this.icon});

}
