databaseChangeLog = {

	changeSet(author: "Casey (generated)", id: "1398131038919-1") {
		addColumn(tableName: "application_file") {
			column(name: "size", type: "integer") {
				constraints(nullable: "false")
			}
		}
	}
}
