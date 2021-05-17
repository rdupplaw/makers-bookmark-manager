# User stories

```
As a user,
so I can revisit my favourite websites,
I want to see a list of my bookmarks.
```

# Domain model

![Domain model](/domain_model.png)

## Installation

1. Connect to `psql`
2. Create the database using the `psql` command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the `psql` command `\c bookmark_manager;`
4. Run the query we have saved in the file `01_create_bookmarks_table.sql`
5. Create a test database using the `psql` command `CREATE DATABASE bookmark_manager_test;`
6. Connect to the database using the `psql` command `\c bookmark_manager_test;`
7. Run the same query saved in the file `01_create_bookmarks_table.sql`
