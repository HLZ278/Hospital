package entity;

public class Doctor {
    private int doctorID;
    private String doctorName;
    private int departmentID;
    private String job;
    private int gender;
    private int age;
    private String expertise;
    private float cost;

    @Override
    public String toString() {
        return "Doctor{" +
                "doctorID=" + doctorID +
                ", doctorName='" + doctorName + '\'' +
                ", departmentID=" + departmentID +
                ", job='" + job + '\'' +
                ", gender=" + gender +
                ", age=" + age +
                ", expertise='" + expertise + '\'' +
                ", cost=" + cost +
                '}';
    }

    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getExpertise() {
        return expertise;
    }

    public void setExpertise(String expertise) {
        this.expertise = expertise;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public Doctor() {
    }
}
