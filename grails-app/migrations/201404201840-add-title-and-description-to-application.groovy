databaseChangeLog = {

	changeSet(author: "Casey (generated)", id: "1398033643476-1") {
		addColumn(tableName: "application") {
			column(name: "description", type: "varchar(255)")
		}
	}

	changeSet(author: "Casey (generated)", id: "1398033643476-2") {
		addColumn(tableName: "application") {
			column(name: "title", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

}
