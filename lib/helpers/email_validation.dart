bool validateEmail (String email){
  const pattern =  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  return RegExp(pattern).hasMatch(email);

}