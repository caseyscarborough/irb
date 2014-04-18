package edu.clayton.irb

class User {

	transient springSecurityService

	String username
	String password
  String firstName
  String lastName
  String email

	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
    firstName nullable: true
    lastName nullable: true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

  Role getRole() {
    getAuthorities().getAt(0)
  }

  boolean hasRole(String role) {
    return getAuthorities().contains(Role.findByAuthority(role))
  }

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

  public String toString() {
    "$firstName $lastName"
  }
}
