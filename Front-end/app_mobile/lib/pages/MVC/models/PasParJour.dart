class PasParJour{
  //Patient _patient = Patient();
  Map<String,int> _dict=<String,int>{};

  PasParJour._internal();

  // Instance singleton
  static final PasParJour _instance = PasParJour._internal();

  // Factory constructor
  factory PasParJour() {
    return _instance;
  }

  Map<String,int> get dict => _dict;

  void setPasJour(Map<String,int> dict){
    _dict=dict;
  }
}