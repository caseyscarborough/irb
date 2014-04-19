databaseChangeLog = {

	changeSet(author: "Casey (generated)", id: "1397916457343-1") {
		createTable(tableName: "application") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "applicationPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "comments", type: "varchar(255)")

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "reviewed_by_id", type: "bigint")

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

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

	changeSet(author: "Casey (generated)", id: "1397916457343-6") {
		createIndex(indexName: "FK5CA40550E549346F", tableName: "application") {
			column(name: "reviewed_by_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397916457343-7") {
		createIndex(indexName: "FK5CA40550F61654C3", tableName: "application") {
			column(name: "user_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397916457343-8") {
		createIndex(indexName: "FK57B0BEC1BCCB1", tableName: "application_file") {
			column(name: "application_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397916457343-3") {
		addForeignKeyConstraint(baseColumnNames: "reviewed_by_id", baseTableName: "application", constraintName: "FK5CA40550E549346F", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "Casey (generated)", id: "1397916457343-4") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "application", constraintName: "FK5CA40550F61654C3", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "Casey (generated)", id: "1397916457343-5") {
		addForeignKeyConstraint(baseColumnNames: "application_id", baseTableName: "application_file", constraintName: "FK57B0BEC1BCCB1", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "application", referencesUniqueColumn: "false")
	}
}
