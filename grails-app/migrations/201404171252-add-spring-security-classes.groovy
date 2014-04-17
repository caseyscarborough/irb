databaseChangeLog = {

	changeSet(author: "Casey (generated)", id: "1397753576036-1") {
		createTable(tableName: "role") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "rolePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "authority", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "Casey (generated)", id: "1397753576036-2") {
		createTable(tableName: "user") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "userPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "account_expired", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "account_locked", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "enabled", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "first_name", type: "varchar(255)")

			column(name: "last_name", type: "varchar(255)")

			column(name: "password", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "password_expired", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "username", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "Casey (generated)", id: "1397753576036-3") {
		createTable(tableName: "user_role") {
			column(name: "role_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "Casey (generated)", id: "1397753576036-4") {
		addPrimaryKey(columnNames: "role_id, user_id", constraintName: "user_rolePK", tableName: "user_role")
	}

	changeSet(author: "Casey (generated)", id: "1397753576036-7") {
		createIndex(indexName: "authority_uniq_1397753575973", tableName: "role", unique: "true") {
			column(name: "authority")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397753576036-8") {
		createIndex(indexName: "username_uniq_1397753575981", tableName: "user", unique: "true") {
			column(name: "username")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397753576036-9") {
		createIndex(indexName: "FK143BF46A50EB90E3", tableName: "user_role") {
			column(name: "role_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397753576036-10") {
		createIndex(indexName: "FK143BF46AF61654C3", tableName: "user_role") {
			column(name: "user_id")
		}
	}

	changeSet(author: "Casey (generated)", id: "1397753576036-5") {
		addForeignKeyConstraint(baseColumnNames: "role_id", baseTableName: "user_role", constraintName: "FK143BF46A50EB90E3", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "role", referencesUniqueColumn: "false")
	}

	changeSet(author: "Casey (generated)", id: "1397753576036-6") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "user_role", constraintName: "FK143BF46AF61654C3", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}
}
