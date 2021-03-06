package dao;
import entity.Doctor;
import entity.Patient;

import java.util.List;

public interface PatientDao {
	public List<Patient> queryPatient(int userID);

    Patient queryPatientByPatientID(int patientID);

    void updatepatient(Patient patient);

    void insertPatient(Patient patient);
    void updatepatientBreak(Patient patient);
    void deletePatient(int patientID);
}
