databaseChangeLog = {

	changeSet(author: "Casey (generated)", id: "1397916189689-1") {
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

	changeSet(author: "Casey (generated)", id: "1397916189689-4") {
		createIndex(indexName: "FK5CA40550E549346F", tableName: "application") {
			column(name: "reviewed_by_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397916189689-5") {
		createIndex(indexName: "FK5CA40550F61654C3", tableName: "application") {
			column(name: "user_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397916189689-2") {
		addForeignKeyConstraint(baseColumnNames: "reviewed_by_id", baseTableName: "application", constraintName: "FK5CA40550E549346F", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "Casey (generated)", id: "1397916189689-3") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "application", constraintName: "FK5CA40550F61654C3", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}
}
