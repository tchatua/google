#!/bin/bash


sudo apt install -y telnet                  # Installs telnet
sudo apt install -y nginx                   # Installs Nginx
sudo systemctl start nginx                  # Start Nginx
sudo systemctl enable nginx                 # Enables Nginx
sudo chmod -R 755 /var/www/html             # Makes all files readable/executable by everyone - Writable only by the owner - Standard permission for web content
sudo mkdir -p /var/www/html/nginxapp1       # Creates a custom directory /var/www/html/nginxapp1
HOSTNAME=$(hostname)

# # Generates two HTML pages (one inside the app folder, one at the root) - Displays hostname, IP address, and version dynamically
# sudo echo "<!DOCTYPE html> <html> <body style='background-color:rgb(250, 210, 210);'> <h1>Welcome to TchatuaIaC - Nginx App1 </h1> <p><strong>VM Hostname:</strong> $HOSTNAME</p> <p><strong>VM IP Address:</strong> $(hostname -I)</p> <p><strong>Application Version:</strong> V1</p> <p>Google Cloud Platform - Lab</p> </body></html>" | sudo tee /var/www/html/nginxapp1/index.html
# sudo echo "<!DOCTYPE html> <html> <body style='background-color:rgb(250, 210, 210);'> <h1>Welcome to TchatuaIaC - Nginx App1 </h1> <p><strong>VM Hostname:</strong> $HOSTNAME</p> <p><strong>VM IP Address:</strong> $(hostname -I)</p> <p><strong>Application Version:</strong> V1</p> <p>Google Cloud Platform - Lab</p> </body></html>" | sudo tee /var/www/html/index.html




cat <<EOF | sudo tee /var/www/html/nginxapp1/index.html
<!DOCTYPE html>
<html>
<body style='background-color:rgb(250, 210, 210);'>
<h1>Welcome to TchatuaIaC - Nginx App1</h1>
<p><strong>VM Hostname:</strong> $(hostname)</p>
<p><strong>VM IP Address:</strong> $(hostname -I)</p>
<p><strong>Application Version:</strong> V1</p>
<p>Google Cloud Platform - Lab</p>
</body>
</html>
EOF

cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
<body style='background-color:rgb(250, 210, 210);'>
<h1>Welcome to TchatuaIaC - Nginx App1</h1>
<p><strong>VM Hostname:</strong> $(hostname)</p>
<p><strong>VM IP Address:</strong> $(hostname -I)</p>
<p><strong>Application Version:</strong> V1</p>
<p>Google Cloud Platform - Lab</p>
</body>
</html>
EOF
