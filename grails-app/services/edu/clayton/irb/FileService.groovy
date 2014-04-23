package edu.clayton.irb

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

import javax.servlet.http.HttpServletResponse

@Transactional
class FileService {

  def grailsApplication
  def grailsLinkGenerator
  def springSecurityService

  /**
   * Downloads a file to the client's browser.
   * @param file ApplicationFile - The file to be downloaded.
   * @param response HttpServletResponse - The Grails response object.
   * @return void
   */
  def download(String fileHash, HttpServletResponse response) {
    def currentUser = springSecurityService.currentUser

    def file = ApplicationFile.findByHash(fileHash)

    if (file.user == currentUser) {
      def download = new File(file?.path)
      if (download?.exists()) {
        response.setContentType("application/octet-stream")
        response.setHeader("Content-disposition", "attachment;filename=${file?.filename}")
        response.outputStream << download?.bytes
        response.outputStream.flush()
      }
    }
  }

  /**
   * Handles the uploading and processing of a file.
   * @param f MultipartFile - The file that was submitted from the form at application/submit.
   * @return Map - The JSON response as a Groovy Map.
   */
  @Transactional
  def upload(MultipartFile f) {
    def currentUser = springSecurityService.currentUser

    if (f) {
      // If the file is empty, don't upload it and return an error.
      if (f?.empty) {
        log.info("An empty file upload was attempted")
        def jsonResponse = [files: [[name: f?.originalFilename, size: f?.size, error: "File cannot be empty."]]]
        return jsonResponse
      }

      File location = new File("${grailsApplication.config.irb.uploadLocation}/${currentUser?.username}")
      location.mkdirs()

      String filename = generateFilename(f?.originalFilename)

      // Upload the file.
      log.info("Uploading file '${filename}' to '${location}'")
      f?.transferTo(new File("${location}/${filename}"))

      def file = new ApplicationFile(filename: filename, location: location, user: currentUser, size: f?.size, hash: filename.encodeAsSHA1(), originalFilename: f?.originalFilename).save(flush: true)
      def jsonResponse = [files: [[name: file?.originalFilename, size: file?.size, url: file?.downloadUrl, deleteUrl: file?.deleteUrl, deleteType: 'DELETE']]]
      return jsonResponse
    }
  }

  /**
   * Handles the deletion of a file.
   * @return Map - The JSON response as a Groovy Map.
   */
  @Transactional
  def delete(ApplicationFile file) {
    def currentUser = springSecurityService.currentUser
    def success = false

    // If the file belongs to the user, and is not associated with an application, allow the user to delete it.
    if (file.user == currentUser && file.application == null) {
      file.delete()
      success = true
    }

    def jsonResponse = [files: [[(file?.filename): success]]]
    return jsonResponse
  }

  /**
   * Returns the list of files that have been uploaded by the user, but have not yet been associated
   * with a submitted application. This is used so that a user will not upload the same files twice,
   * and they will not lose track of the files they have uploaded without submitting their application.
   * @return Map - The JSON response as a Groovy Map.
   */
  def getPendingFileList() {
    def currentUser = springSecurityService.currentUser

    // Get the files that have not been associated with an application and display them.
    def jsonResponse = [files: []]
    ApplicationFile.findAllByUserAndApplication(currentUser, null).each { file ->
      jsonResponse['files'] << [name: file?.originalFilename, size: file?.size, url: file?.downloadUrl, deleteUrl: file?.deleteUrl, deleteType: 'DELETE']
    }
    return jsonResponse
  }

  private String generateFilename(String originalFilename) {
    def filename = originalFilename.replace(' ', '_')
    def date = new Date().format('yyyyMMddHHmmss')
    return "${date}-${filename}"
  }

}
