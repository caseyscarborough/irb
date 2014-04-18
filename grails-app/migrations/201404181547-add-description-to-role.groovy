databaseChangeLog = {

	changeSet(author: "Casey (generated)", id: "1397850458102-1") {
		addColumn(tableName: "role") {
			column(name: "description", type: "varchar(255)")
		}
	}
}
