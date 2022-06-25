class Data {
  String Nama;
  int NomerHP;
  String Email;
  String Password;
  String ID;

  Data(
      {this.ID = '',
      required this.Nama,
      required this.NomerHP,
      required this.Email,
      required this.Password});

  Map<String, dynamic> toJson() => {
        "ID": ID,
        "NamaLengkap": Nama,
        "NomerHP": NomerHP,
        "Email": Email,
        "Password": Password
      };

  static Data fromJson(Map<dynamic, dynamic> json) => Data(
      ID: json['ID'],
      Nama: json['Nama'],
      NomerHP: json['NomerHP'],
      Email: json['Email'],
      Password: json["Password"]);
}
