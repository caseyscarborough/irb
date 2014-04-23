import edu.clayton.irb.Role
import edu.clayton.irb.User
import edu.clayton.irb.UserRole
import grails.util.Environment

class BootStrap {

  def grailsApplication

  def init = { servletContext ->
    if (Environment.getCurrent() == Environment.DEVELOPMENT) {
      def config = grailsApplication.config.irb

      def adminRole = Role.findByAuthority('ROLE_ADMIN')
      def userRole  = Role.findByAuthority('ROLE_USER')
      def reviewerRole = Role.findByAuthority(config.roles.names.reviewer)
      def chairRole = Role.findByAuthority(config.roles.names.chair)

      // If the admin role doesn't exist, create it now.
      if (!adminRole) {
        log.info("| Create admin role...")
        adminRole = new Role(authority: 'ROLE_ADMIN', description: 'Administrator Role').save(flush: true)
      }

      // If the user role doesn't exist, create it now.
      if (!userRole) {
        log.info("| Creating user role...")
        userRole = new Role(authority: 'ROLE_USER', description: 'Default User Role').save(flush: true)
      }

      if (!reviewerRole) {
        log.info("| Creating reviewer role...")
        reviewerRole = new Role(authority: config.roles.names.reviewer, description: config.roles.descriptions.reviewer).save(flush: true)

      }

      if (!chairRole) {
        log.info("| Creating chair role...")
        chairRole = new Role(authority: config.roles.names.chair, description: config.roles.descriptions.chair).save(flush: true)
      }


      // If the admin user doesn't exist, create it now.
      if (!User.findByUsername('admin')) {
        log.info("| Creating admin user...")
        def admin = new User(username: 'admin', password: 'admin', firstName: 'Admin', lastName: 'User', email: 'admin@example.com').save(flush: true)
        UserRole.create(admin, adminRole, true)
      }
    }
  }
  def destroy = {
  }
}
