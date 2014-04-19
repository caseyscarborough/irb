databaseChangeLog = {

	changeSet(author: "Casey (generated)", id: "1397916457343-2") {
		createTable(tableName: "application_file") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "application_fPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "application_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "filename", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "location", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "Casey (generated)", id: "1397916457343-8") {
		createIndex(indexName: "FK57B0BEC1BCCB1", tableName: "application_file") {
			column(name: "application_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397916457343-5") {
		addForeignKeyConstraint(baseColumnNames: "application_id", baseTableName: "application_file", constraintName: "FK57B0BEC1BCCB1", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "application", referencesUniqueColumn: "false")
	}
}
