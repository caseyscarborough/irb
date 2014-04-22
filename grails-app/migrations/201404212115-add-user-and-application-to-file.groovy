databaseChangeLog = {

	changeSet(author: "Casey (generated)", id: "1398129326670-1") {
		addColumn(tableName: "application_file") {
			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "Casey (generated)", id: "1398129326670-2") {
		dropNotNullConstraint(columnDataType: "bigint", columnName: "application_id", tableName: "application_file")
	}

	changeSet(author: "Casey (generated)", id: "1398129326670-3") {
		modifyDataType(columnName: "type", newDataType: "integer", tableName: "status")
	}

	changeSet(author: "Casey (generated)", id: "1398129326670-4") {
		addNotNullConstraint(columnDataType: "integer", columnName: "type", tableName: "status")
	}

	changeSet(author: "Casey (generated)", id: "1398129326670-6") {
		createIndex(indexName: "FK57B0BF61654C3", tableName: "application_file") {
			column(name: "user_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1398129326670-5") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "application_file", constraintName: "FK57B0BF61654C3", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}
}
