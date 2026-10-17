
#!/bin/bash
dnf update -y
dnf install -y httpd

systemctl enable httpd
systemctl start httpd

cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>HA Web Server - Server 2</title>
</head>
<body>
    <h1>High Availability Web Server</h1>
    <h2>Server 2</h2>
    <p>Response from EC2 Server 2</p>
</body>
</html>
EOF
