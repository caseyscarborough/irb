databaseChangeLog = {

	changeSet(author: "Casey (generated)", id: "1398267957071-1") {
		addColumn(tableName: "application_file") {
			column(name: "original_filename", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}
}
