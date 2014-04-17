databaseChangeLog = {

	changeSet(author: "Casey (generated)", id: "1397774754592-1") {
		addColumn(tableName: "user") {
			column(name: "email", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}
}
