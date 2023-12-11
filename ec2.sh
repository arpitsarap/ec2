sudo su
sudo yum install nginx
sudo yum install docker
sudo systemctl start nginx
sudo service docker start
sudo docker run -d -p 3000:3000 bkimminich/juice-shop
sudo yum install git
cd /
cd home
sudo git clone https://github.com/arpitsarap/ec2.git
cd ec2
sudo cp libngx_http_protectonce_mirror_module.so /usr/share/nginx/modules/
sudo cp nginx_confix_ec2 /etc/nginx/nginx.conf
sudo systemctl reload nginx

