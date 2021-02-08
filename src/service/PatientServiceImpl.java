package service;
import dao.PatientDAOImpl;
import entity.Patient;
import java.util.List;
public class PatientServiceImpl implements PatientService{
    @Override
    public List<Patient> queryPatient(int userID) {
        PatientDAOImpl patientDAO = new PatientDAOImpl();
        return patientDAO.queryPatient(userID);
    }

    @Override
    public Patient queryPatientByPatientID(int patientID) {
        PatientDAOImpl patientDAO = new PatientDAOImpl();
        return patientDAO.queryPatientByPatientID(patientID);
    }

    @Override
    public void updatepatient(Patient patient) {
        PatientDAOImpl patientDAO = new PatientDAOImpl();
        patientDAO.updatepatient(patient);
    }

    @Override
    public void insertPatient(Patient patient) {
        PatientDAOImpl patientDAO = new PatientDAOImpl();
        patientDAO.insertPatient(patient);
    }

    @Override
    public void updatepatientBreak(Patient patient) {
        PatientDAOImpl patientDAO = new PatientDAOImpl();
        patientDAO.updatepatientBreak(patient);
    }

    @Override
    public void deletePatient(int patientID) {
        PatientDAOImpl patientDAO = new PatientDAOImpl();
        patientDAO.deletePatient(patientID);
    }
}
