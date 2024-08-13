class TaskModel {
  String id;
  String title;
  String subTitle;
  bool isDone;
  int date;
  String userId;
  TaskModel(
      {this.id = '',
      required this.title,
      required this.subTitle,
      this.isDone = false,
      required this.date,
      required this.userId});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'],
          userId: json['userId'],
          subTitle: json['subTitle'],
          date: json['date'],
          id: json['id'],
          isDone: json['isDone'],
        );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subTitle': subTitle,
      'date': date,
      'id': id,
      'isDone': isDone,
      'userId': userId,
    };
  }
}
