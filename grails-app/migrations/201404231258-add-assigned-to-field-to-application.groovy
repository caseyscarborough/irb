databaseChangeLog = {

	changeSet(author: "Casey (generated)", id: "1398272331091-1") {
		addColumn(tableName: "application") {
			column(name: "assigned_to_id", type: "bigint")
		}
	}

	changeSet(author: "Casey (generated)", id: "1398272331091-3") {
		createIndex(indexName: "FK5CA405508CC85262", tableName: "application") {
			column(name: "assigned_to_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1398272331091-2") {
		addForeignKeyConstraint(baseColumnNames: "assigned_to_id", baseTableName: "application", constraintName: "FK5CA405508CC85262", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}
}
