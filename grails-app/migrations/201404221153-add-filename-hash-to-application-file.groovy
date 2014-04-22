databaseChangeLog = {

	changeSet(author: "Casey (generated)", id: "1398182031920-1") {
		addColumn(tableName: "application_file") {
			column(name: "hash", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}
}
