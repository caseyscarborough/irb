databaseChangeLog = {

	changeSet(author: "Casey (generated)", id: "1397919836063-1") {
		addColumn(tableName: "application") {
			column(name: "status_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "Casey (generated)", id: "1397919836063-4") {
		createIndex(indexName: "FK5CA4055036DA7923", tableName: "application") {
			column(name: "status_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397919836063-3") {
		addForeignKeyConstraint(baseColumnNames: "status_id", baseTableName: "application", constraintName: "FK5CA4055036DA7923", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "status", referencesUniqueColumn: "false")
	}
}
