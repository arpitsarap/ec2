sudo su
yum  install docker
systemctl start docker
yum install nginx
systemctl start nginx
cd /
cd home/
ls
cd ec2
cd 1.24
cp libngx_http_protectonce_mirror_module.so /usr/share/nginx/modules/
cd ..
cp nginx_confix_ec2 /etc/nginx/nginx.conf
docker run -it -d -p 3001:3000 -e PORT=5000 pradyum619/users-express-app

echo "Change the nginx.conf as per req."
