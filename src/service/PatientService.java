package service;
import entity.Patient;

import java.util.List;

public interface PatientService {
	public List<Patient> queryPatient(int userID);

    Patient queryPatientByPatientID(int patientID);

    void updatepatient(Patient patient);

    void insertPatient(Patient patient);

    void deletePatient(int patientID);
}
