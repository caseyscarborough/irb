package edu.clayton.irb

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured('IS_AUTHENTICATED_FULLY')
class FileController {

  def fileService

  /**
   * Upload handler used for the upload form for ApplicationController#submit.
   * Passes the uploaded file to the FileService for uploading and processing.
   */
  def upload() {
    def file = params['files[]']

    // If a file exists in the request, upload it.
    if (file) {
      render fileService.upload(file) as JSON
      return
    }

    // If not, return a list of pending files.
    render fileService.getPendingFileList() as JSON
  }

  /**
   * Downloads a file based on it's ID.
   * @param file ApplicationFile, the file to be downloaded.
   */
  def download(ApplicationFile file) {
    fileService.download(file, response)
  }

  /**
   * Downloads a file based on it's ID.
   * @param file ApplicationFile, the file to be downloaded.
   */
  def delete(ApplicationFile file) {
    render fileService.delete(file) as JSON
  }

}
