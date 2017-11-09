package edu.uade.ia.tpo;

public class Patient {

    public enum Sexo {
        MASCULINO, FEMENINO
    }

    public enum ScholarshipLevel {
        SINESTUDIOS, PRIMARIO, SECUNDARIO, TERCIARIO, UNIVERSITARIO, POSGRADO
    }

    private String name;
    private Long dni;
    private Sexo sex;
    private String familyRelation;
    private ScholarshipLevel scholarshipLevel;
    private String profession;
    private String work;
    private String hobbies;
    private String personalTastes;
    private Integer age;

    public Patient(String name, Long dni, Sexo sex, String familyRelation, ScholarshipLevel scholarshipLevel, String profession, String work, String hobbies, String personalTastes, Integer age) {
        this.name = name;
        this.dni = dni;
        this.sex = sex;
        this.familyRelation = familyRelation;
        this.scholarshipLevel = scholarshipLevel;
        this.profession = profession;
        this.work = work;
        this.hobbies = hobbies;
        this.personalTastes = personalTastes;
        this.age = age;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Patient patient = (Patient) o;

        return dni != null ? dni.equals(patient.dni) : patient.dni == null;
    }

    @Override
    public int hashCode() {
        return dni != null ? dni.hashCode() : 0;
    }

    public String getName() {
        return name;
    }

    public Long getDni() {
        return dni;
    }

    public Sexo getSex() {
        return sex;
    }

    public String getFamilyRelation() {
        return familyRelation;
    }

    public ScholarshipLevel getScholarshipLevel() {
        return scholarshipLevel;
    }

    public String getProfession() {
        return profession;
    }

    public String getWork() {
        return work;
    }

    public String getHobbies() {
        return hobbies;
    }

    public String getPersonalTastes() {
        return personalTastes;
    }

    public Integer getAge() {
        return age;
    }

    public String toCsv() {
        return dni + "," +
                age + "," +
                personalTastes.replaceAll(",", "#") + "," +
                hobbies.replaceAll(",", "#") + "," +
                work.replaceAll(",", "#") + "," +
                profession.replaceAll(",", "#") + "," +
                scholarshipLevel.name() + "," +
                sex.name() + "," +
                name.replaceAll(",", "#") + "," +
                familyRelation.replaceAll(",", "#");
    }

    public static Patient fromCsv(final String csv) {
        String[] tokens = csv.split(",");
        if (tokens.length != 10) {
            throw new RuntimeException("Formato incorrecto para csv de paciente " + csv);
        }
        return new Patient(
                tokens[8],
                Long.valueOf(tokens[0]),
                Sexo.valueOf(tokens[7]),
                tokens[9],
                ScholarshipLevel.valueOf(tokens[6]),
                tokens[5],
                tokens[4],
                tokens[3],
                tokens[2],
                Integer.valueOf(tokens[1])
        );
    }
}
