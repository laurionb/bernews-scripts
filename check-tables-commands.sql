# Generate CHECK TABLE commands for all tables
# You can pipe these commands back into MySQL. E.g.:
#   mysql check-tables-commands.sql | mysql | grep -v " OK"
SELECT CONCAT('CHECK TABLE ', tables.table_schema, '.', tables.table_name, ';') AS command
FROM information_schema.tables 
WHERE tables.table_schema<>'performance_schema'
 AND tables.table_schema<>'mysql'
 AND tables.table_schema<>'information_schema'
ORDER BY table_name;
