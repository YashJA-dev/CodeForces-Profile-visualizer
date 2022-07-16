class Api{
  final String handle;
  Api({required this.handle});
  
  String userInfoAPI(){
      return 'https://codeforces.com/api/user.info?handles=$handle';
  }
  String ContestInfoAPI(){
      return 'https://codeforces.com/api/user.rating?handle=$handle';
  } 
  String problemInfoApi(){
    return "https://codeforces.com/api/user.status?handle=${handle}&from=1";
  }
}