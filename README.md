# IRB

This application is used to approve, monitor, review, and track research done by faculty at Clayton State University.

This was developed as a part of my senior project for the Computer Science program.

## Running the Application Locally

The application has the following dependencies:

* [Java 7](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html)
* [Grails 2.3.7](http://grails.org/download) (not needed if using the Grails wrapper)
* [MySQL](http://dev.mysql.com/downloads/mysql/)

Begin by cloning the repository (or downloading the source from this repository).

```bash
$ git clone https://github.com/caseyscarborough/irb
$ cd irb
```

Update the [DataSource.groovy](https://github.com/caseyscarborough/irb/blob/master/grails-app/conf/DataSource.groovy) file with the credentials and database name used for your MySQL database.

```groovy
dataSource {
  pooled = true
  driverClassName = "com.mysql.jdbc.Driver"
  dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
  username = "root"  // Set your username and password here
  password = ""
  dbCreate = "none"
}

environments {
  development {
    dataSource {
      // Update the connection string below
      url = "jdbc:mysql://localhost:3306/irb_development"
    }
  }
}
```

Edit the [Config.groovy]() file with your desired configuration.

```groovy
irb {
  // Filetypes that can be uploaded with an application
  supportedFiletypes = [ 'PDF', 'JPG', 'PNG', 'GIF', 'DOCX', 'DOC', 'XLS', 'XLSX', 'JPEG' ]

  // The max file size for an uploaded file
  maxFileSize = 100000000 // 100MB

  // The location to upload user's files to
  uploadLocation = "/path/to/directory"       // Unix-based OS
  uploadLocation = "C:\\Path\\To\\Directory"  // Windows-based OS
}
```

Then run the Grails database migrations on your database to create the necessary schema.

> Note: All Grails commands can be run without Grails being installed by using the Grails wrapper in this repository. Just replace each call to the `grails` command with the `grailsw` or `grailsw.bat` file (depending on your OS).

```bash
$ grails dbm-update
```

You should now be able to start up the application.

```bash
$ grails run-app
```

Navigate to [localhost:8080/irb](http://localhost:8080/irb) in your browser to see the application in action.

## Deploying the Application

To deploy the application, ensure that the necessary configuration options shown above have been set, then issue the following command from the root of the application:

```bash
$ grails war irb.war
```

The WAR file will be generated at `target/irb.war`, which can then be uploaded and deployed to [Tomcat](http://tomcat.apache.org/) or the application server of your choice.