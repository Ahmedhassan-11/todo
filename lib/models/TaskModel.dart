class TaskModel {
  String id;
  String title;
  String description;
  int date;
  bool isdone;

  TaskModel({this.id="", required this.title,required this.description,required this.date, this.isdone=false});

  TaskModel.fromjson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          isdone: json['isdone'],
          date: json['date'],
          description: json['description'],
          title: json['title'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "title":title,
      "description":description,
      "date":date,
      "isdone":isdone,

    };
  }
}
