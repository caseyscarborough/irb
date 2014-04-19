databaseChangeLog = {

	changeSet(author: "Casey (generated)", id: "1397917262263-1") {
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

			column(name: "status_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "Casey (generated)", id: "1397917262263-2") {
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

	changeSet(author: "Casey (generated)", id: "1397917262263-3") {
		createTable(tableName: "status") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "statusPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "description", type: "varchar(255)")

			column(name: "name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "type", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "Casey (generated)", id: "1397917262263-8") {
		createIndex(indexName: "FK5CA4055036DA7923", tableName: "application") {
			column(name: "status_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397917262263-9") {
		createIndex(indexName: "FK5CA40550E549346F", tableName: "application") {
			column(name: "reviewed_by_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397917262263-10") {
		createIndex(indexName: "FK5CA40550F61654C3", tableName: "application") {
			column(name: "user_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397917262263-11") {
		createIndex(indexName: "FK57B0BEC1BCCB1", tableName: "application_file") {
			column(name: "application_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397917262263-4") {
		addForeignKeyConstraint(baseColumnNames: "reviewed_by_id", baseTableName: "application", constraintName: "FK5CA40550E549346F", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "Casey (generated)", id: "1397917262263-5") {
		addForeignKeyConstraint(baseColumnNames: "status_id", baseTableName: "application", constraintName: "FK5CA4055036DA7923", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "status", referencesUniqueColumn: "false")
	}

	changeSet(author: "Casey (generated)", id: "1397917262263-6") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "application", constraintName: "FK5CA40550F61654C3", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "Casey (generated)", id: "1397917262263-7") {
		addForeignKeyConstraint(baseColumnNames: "application_id", baseTableName: "application_file", constraintName: "FK57B0BEC1BCCB1", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "application", referencesUniqueColumn: "false")
	}
}
