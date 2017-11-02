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
}
