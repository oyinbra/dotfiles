#!/bin/zsh

db() {
  # Define an associative array with PostgreSQL commands + emojis
  declare -A commands=(
    ["🌐 Show Network Interfaces"]="ip addr show"
    ["▶️ Start PostgreSQL"]="sudo systemctl start postgresql"
    ["⏹ Stop PostgreSQL"]="sudo systemctl stop postgresql"
    ["🔄 Restart PostgreSQL"]="sudo systemctl restart postgresql"
    ["📊 Check PostgreSQL Status"]="sudo systemctl status postgresql"
    ["📌 Enable PostgreSQL on Startup"]="sudo systemctl enable postgresql"
    ["📴 Disable PostgreSQL on Startup"]="sudo systemctl disable postgresql"
    ["🔐 Log into PostgreSQL"]="psql -U oyinbra -d postgres"
    ["🔓 Log into Specific Database"]="log_into_database"
    ["📋 List Databases"]="psql -U oyinbra -c '\\l'"
    ["➕ Create New Database"]="create_database"
    ["🗑 Drop Database"]="drop_database"
    ["👤 Create New User"]="create_user"
    ["🔑 Change User Password"]="change_user_password"
    ["📂 List Tables in Database"]="list_tables"
    ["💾 Backup Database"]="backup_database"
    ["♻️ Restore Database"]="restore_database"
    ["🔍 Show Active Connections"]="psql -U oyinbra -c 'SELECT * FROM pg_stat_activity;'"
    ["🚪 Quit"]=": # Quit the function"
  )

  # Helper functions
  create_database() {
    echo "Enter the name of the new database: "
    read dbname
    psql -U oyinbra -c "CREATE DATABASE $dbname;"
    echo "✅ Database '$dbname' created."
  }

  drop_database() {
    echo "Enter the name of the database to drop: "
    read dbname
    psql -U oyinbra -c "DROP DATABASE $dbname;"
    echo "❌ Database '$dbname' dropped."
  }

  create_user() {
    echo "Enter the name of the new user: "
    read username
    echo "Enter the password for the new user: "
    read -s password
    psql -U oyinbra -c "CREATE USER $username WITH PASSWORD '$password';"
    echo -e "✅ User '$username' created."
  }

  change_user_password() {
    echo "Enter the username: "
    read username
    echo "Enter the new password: "
    read -s password
    psql -U oyinbra -c "ALTER USER $username WITH PASSWORD '$password';"
    echo -e "🔑 Password for user '$username' changed."
  }

  list_tables() {
    echo "Enter the database name: "
    read dbname
    psql -U oyinbra -d "$dbname" -c "\\dt"
  }

  backup_database() {
    echo "Enter the database name to backup: "
    read dbname
    echo "Enter the path to save the backup (e.g., /path/to/backup.sql): "
    read filepath
    pg_dump -U oyinbra -d "$dbname" -F c -f "$filepath"
    echo "💾 Backup of '$dbname' saved to '$filepath'."
  }

  restore_database() {
    echo "Enter the path of the backup file (e.g., /path/to/backup.sql): "
    read filepath
    echo "Enter the name of the database to restore to: "
    read dbname
    pg_restore -U oyinbra -d "$dbname" -1 "$filepath"
    echo "♻️ Database '$dbname' restored from '$filepath'."
  }

  log_into_database() {
    echo "Enter the database name to log into: "
    read dbname
    psql -U oyinbra -d "$dbname"
  }

  while true; do
    local choice=$(printf "%s\n" "${(@k)commands}" | fzf --height 20 --prompt "🐘 Select a PostgreSQL Command: " --border)

    if [[ -z "$choice" || "$choice" == "🚪 Quit" ]]; then
      echo "👋 Exiting PostgreSQL Command Manager."
      break
    fi

    eval "${commands[$choice]}"
  done
}

