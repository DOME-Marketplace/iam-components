package org.dome.iam.it.model;

import lombok.Getter;

/**
 * Representation of a User's environment. This represents the components used by and end-user (either human or machine) to
 * interact with the consumer and provider environments.
 */
@Getter
public class UserEnvironment {

	/**
	 * The wallet of the user. It will contain the logic for the authentication flows, as well as the once for
	 * receiving credentials.
	 */
	private final Wallet wallet = new Wallet();
	/**
	 * The demo application that the user uses. Contains sessions and urls required for simulating an application and the
	 * methods to fulfill the typical duties of an application.
	 */
	private final Application application = new Application();
}
