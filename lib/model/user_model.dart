class UserModel
{
  final String name ;
  final String email ;
  final String uID ;
  final String imageURL;

  UserModel(this.name, this.email, this.uID,this.imageURL);

   Map<String, dynamic> toMap() {
    return {
      'uID':uID,
      'name': name,
      'email': email,
      'date':DateTime.now(),
      'image':imageURL,
    };
  }

  factory UserModel.fromJson(jsonData) {
    return UserModel(jsonData['name'], jsonData['email'],jsonData['uID'],jsonData['image']);
  }
}