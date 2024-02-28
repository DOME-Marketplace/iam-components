package org.dome.iam.it.model;

public record ApplicationConfig(String applicationUrl, String verifierDid, String verifierAddress, String tokenPath, String securedBackend, String clientId) {

}
