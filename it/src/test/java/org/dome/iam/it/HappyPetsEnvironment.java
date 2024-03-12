package org.dome.iam.it;

public class HappyPetsEnvironment {

	public static String HAPPYPETS_DID = "did:key:z6MkigCEnopwujz8Ten2dzq91nvMjqbKQYcifuZhqBsEkH7g";
	public static String HAPPYPETS_ADMIN_USER = "fiwareAdmin";
	public static String HAPPYPETS_ADMIN_PASSWORD = "fiwareAdmin";
	public static String HAPPYPETS_GOLD_USER = "prime-user";
	public static String HAPPYPETS_GOLD_USER_PASSWORD = "prime-user";
	// currently not verified, thus does not need to be a real one
	public static String HAPPYPETS_GOLD_USER_DID = "did:user:gold";

	// the keycloak
	public static String HAPPYPETS_ISSUER_ADDRESS = "http://localhost:8080/";
	public static String HAPPYPETS_ISSUER_REALM = "fiware-server";

}
