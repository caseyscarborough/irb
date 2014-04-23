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

  String getAuthoritiesString() {
    def output = new StringBuilder()
    this.getAuthorities().eachWithIndex { a, i ->
      if (i > 0) {
        output.append(", ")
      }
      output.append(a)
    }
    return output.toString()
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

  static Set<User> findAllHavingRole(String roleName) {
    def users = []
    def role = Role.findByAuthority(roleName)

    if (role) {
      User.findAllByEnabled(true).each { u ->
        if (u.authorities.contains(role)) {
          users << u
        }
      }
      return users
    }
    return null
  }

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

  public String toString() {
    "$firstName $lastName"
  }
}
