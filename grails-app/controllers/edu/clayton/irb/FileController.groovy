package edu.clayton.irb

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured('IS_AUTHENTICATED_FULLY')
class FileController {

  def springSecurityService

  def upload() {
    def f = params['files[]']
    def currentUser = springSecurityService.currentUser

    if (f) {

      // If the file is empty, don't upload it and return an error.
      if (f?.empty) {
        log.info("An empty file upload was attempted")
        render "{ \"files\": [ { \"name\": \"${f?.originalFilename}\", \"size\": ${f?.size}, \"error\": \"File cannot be empty.\" } ] }"
        return
      }

      File location = new File("${grailsApplication.config.irb.uploadLocation}/${currentUser?.username}")
      location.mkdirs()

      String filename = "${new Date().format('yyyyMMddHHmmss')}_${f?.originalFilename}"

      // Upload the file.
      log.info("Uploading file '${filename}' to '${location}'")
      f?.transferTo(new File("${location}/${filename}"))

      def file = new ApplicationFile(filename: filename, location: location, user: currentUser, size: f?.size).save(flush: true)
      def deleteUrl = createLink(action: 'delete', params: [id: file.id])

      def jsonResponse = [files: [[name: file?.filename, size: file?.size, deleteUrl: deleteUrl, deleteType: 'DELETE']]]
      render jsonResponse as JSON
      return
    }

    // Get the files that have not been associated with an application and display them.
    def jsonResponse = [files: []]
    ApplicationFile.findAllByUserAndApplication(currentUser, null).each { file ->
      def deleteUrl = createLink(action: 'delete', params: [id: file.id])
      jsonResponse['files'] << [name: file?.filename, size: file?.size, deleteUrl: deleteUrl, deleteType: 'DELETE']
    }
    render jsonResponse as JSON
  }

  def delete(ApplicationFile file) {
    def currentUser = springSecurityService.currentUser
    def success = false

    // If the file belongs to the user, and is not associated with an application, allow the user to delete it.
    if (file.user == currentUser && file.application == null) {
      file.delete()
      success = true
    }

    def jsonResponse = [files: [[(file?.filename): success]]]
    render jsonResponse as JSON
  }
}