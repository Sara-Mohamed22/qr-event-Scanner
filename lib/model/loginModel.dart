class LoginModel
{
  Data? data ;
  String? message ;
  int? status ;
  bool? success ;
  dynamic errors ;


  LoginModel({
             this.data ,
             this.message ,
             this.status ,
             this.success ,
              this.errors
           });

  Map<String , dynamic >  toJson()
    {
      return
        {
        'data' : data?.ToJson()  ,
        'message' : message ,
          'errors' :errors ,
         'status' : status ,
        'success' : success,

        };
    }

  LoginModel.fromJson(Map< String , dynamic> json )
  {
    message = json['message']  ;
    errors = json['errors'] ;
    status = json['status'] ;
    success = json['success'];
    data = json['data'] !=null ? Data.FromJson(json['data']) : null ;


  }

}


class Data
{
   int? id ;
   String? name ;
   String? userName ;
   String? email ;
   String? phone ;
   String? access_token ;


   Data({
        this.id ,
        this.name ,
        this.email ,
        this.phone ,
        this.access_token,
         this.userName ,
       });
   
   Map<String , dynamic> ToJson()
   {
     return
       {
         'id' : id ,
         "name" : name ,
         'email' :  email ,
         'phone' : phone ,
         'access_token' : access_token ,
         'user_name' : userName ,

       };
   }
   
   Data.FromJson(Map<String , dynamic> Json)
   {
      id = Json['id'];
      name =Json["name"];
      userName = Json["user_name"];
       email =Json['email'];
      phone =Json['phone'];
      access_token =Json['access_token'];
   }

}

class Avatar
{
   String? thumb ;
   String? small ;
   String? medium ;
   String? large ;
   String?  extraLarge ;
   String? original ;

   Avatar({
     this.thumb ,
     this.small ,
     this.medium ,
     this.large ,
     this.extraLarge ,
     this.original
     });
   
   Map<String , dynamic> ToJson()
   {
     return {
       'thumb' : thumb ,
       'small' : small ,
       'medium' : medium ,
       'large' : large ,
       'extra_large' : extraLarge ,
       'original' : original
     };
   }
   
   Avatar.FromJson(Map<String , dynamic> json)
   {
     thumb = json['thumb'] ;
     small = json['small'];
     medium = json['medium'];
     large = json['large'] ;
     extraLarge = json['extra_large'];
     original = json['original'] ;
   }
}

