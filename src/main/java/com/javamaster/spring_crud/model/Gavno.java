package com.javamaster.spring_crud.model;

public class Gavno {

    private String firstName;
    private String lastName;
    private String bratName;

    public Gavno() {

    }

    public Gavno(String firstName, String lastName, String bratName) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.bratName = bratName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getBratName() {
        return bratName;
    }

    public void setBratName(String bratName) {
        this.bratName = bratName;
    }
}
