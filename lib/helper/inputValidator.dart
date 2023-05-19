class InputValidator {

  static String? isNationalNumberValid(String? NationalNumber) {
    if (NationalNumber!.trim().isEmpty) {

      return "National Number must not be empty";
    } else if (NationalNumber.trim().length < 14 ||NationalNumber.trim().length > 14) {
      return "National Number must be 14 number ";
    } else return null;
  }

  static String? isPasswordValid(String? password) {
    if (password!.trim().isEmpty) {
      return "Password must not be empty";
    } else if (password.length < 6) {
      return "week password";
    } else return null;
  }

  static String? isPhoneValid(String? phone) {
    if (phone!.trim().isEmpty) {
      return "Phone must not be empty";
    } else if (phone.length < 11) {
      return "phone must be at least 11 number";
    } else if (!phone.startsWith("01")) {
      return "phone must start with 01(-----)";
    }
    else
      return null;
  }

  static String? isNameValid(String? name) {
    if (name!.trim().isEmpty) {
      return "Name must not be empty";
    } else if (name.length < 4) {
      return "Please Write Correct Name";
    } else
      return null;
  }

  static String? isAddressValid(String? address) {
    if (address!.trim().isEmpty) {
      return "Address must not be empty";
    } else if (address.length < 4) {
      return "Address Write Correct Name";
    } else
      return null;
  }

  static String? isEmailValid(String? email){
    if(email!.trim().isEmpty){
      return "Email must not be empty";
    }else if (!email.trim().endsWith("@gmail.com")){
      return "Email must end with  @gmail.com ";
    }else return null ;
  }


  static String? isAgeValid(String? age) {
    if (age!.trim().isEmpty) {

      return "Age must not be empty";
    } else if (age.trim().length > 2) {
      return "Age must be at least 2 number ";
    } else
      return null;
  }
  static String? isUserNameValid(String? email){
    if(email!.trim().isEmpty){
      return "User Name must not be empty";
    }else if (email.trim().length < 7){
      return "User Name must at least 6 ";
    }else return null ;
  }



  static String? isclothesValid(String? clothes) {
    if (clothes!.trim().isEmpty) {
      return "clothes must not be empty";
    } else if (clothes.length < 4) {
      return "Please Write Correct clothes";
    } else
      return null;
  }


  static String? isbirthmarksValid(String? birthmark) {
    if (birthmark!.trim().isEmpty) {
      return "birthmark must not be empty can but yes or no";
    } else if (birthmark.length < 2) {
      return "Please Write Correct birthmark";
    } else
      return null;
  }



  static String? isPoliceStationValid(String? policeStation) {
    if (policeStation!.trim().isEmpty) {
      return "police Station must not be empty ";
    } else if (policeStation.length < 6) {
      return "Please Write Correct police Station";
    } else
      return null;
  }



}