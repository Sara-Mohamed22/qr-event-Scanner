class TicketModel
{
  Data? data ;
  String? msg ;
  int? status ;
  bool? success ;
  dynamic errors ;

  TicketModel({this.errors , this.success , this.status , this.msg , this.data });

  Map<String , dynamic> toJson()
  {
    return
      {
        "data" : data?.toJson() ,
        "message": msg,
        "status": status,
        "success": success,
        "errors": errors
       };
  }

  TicketModel.FromJson(Map<String ,dynamic> json)
  {
    data = json['data'] !=null ? Data.FromJson(json['data']) : null ;
    msg = json["message"];
    status = json["status"];
    success =json["success"];
    errors = ["errors"];

  }

}

class Data {
  bool? can_attend;

  Data({this.can_attend});

  Map<String, dynamic> toJson() {
    return
      {
        "can_attend " : can_attend ,
      };
  }


  Data.FromJson(Map<String ,dynamic> json)
  {
    can_attend = json['can_attend'];
  }

}