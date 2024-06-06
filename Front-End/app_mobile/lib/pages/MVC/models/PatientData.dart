import 'Patient.dart';

class PatientData {
  Patient _patient = Patient();

  PatientData._internal();

  // Instance singleton
  static final PatientData _instance = PatientData._internal();

  // Factory constructor
  factory PatientData() {
    return _instance;
  }

  Patient get patient => _patient;

  void setPatient(Patient patient) {
    _patient = patient;
  }
}
