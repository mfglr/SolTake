class ClientIdGenerator {
  static int id = 9000000000000000000;
  
  static int generate(){
    var r = id;
    id++;
    return r;
  }
}