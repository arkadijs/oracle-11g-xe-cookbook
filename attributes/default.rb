node.default["oracle-11g-ee"][:temp_dir] = "/oracle_tmp"
node.default["oracle-11g-ee"][:pack_list] = ["libaio", "bc", "flex", "zip", "unzip"]

node.default["oracle-11g-ee"][:oracle_zipfile] = ["/vagrant/oracle-xe-11.2.0-1.0.x86_64.rpm.zip"]

node.default["oracle-11g-ee"][:oracle_http_port] = 8080
node.default["oracle-11g-ee"][:oracle_listener_port] = 1521
node.default["oracle-11g-ee"][:oracle_password] = "vagrant"
node.default["oracle-11g-ee"][:oracle_dbenable] = "y"

node.default["oracle-11g-ee"][:oracle_env_path] = "/u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh"