import edu.clayton.irb.Role
import edu.clayton.irb.User
import grails.util.Environment

class BootStrap {

  def init = { servletContext ->
    if (Environment.getCurrent() == Environment.DEVELOPMENT) {

      def role = Role.findByAuthority('ROLE_ADMIN')
      if (!role) {
        log.info("| Create admin role...")
        role = new Role(authority: 'ROLE_ADMIN', description: 'Administrator Role').save(flush: true)
      }

      if (!User.findByUsername('admin')) {
        log.info("| Creating admin user...")
        def admin = new User(username: 'admin', password: 'admin', firstName: 'Admin', lastName: 'User', email: 'admin@example.com').save(flush: true)
        admin.getAuthorities().add(role)
      }
    }
  }
  def destroy = {
  }
}
