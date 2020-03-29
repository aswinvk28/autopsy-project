sudo docker exec investigate sh /opt/autopsy/autopsy-4.14.0/unix_setup.sh

echo -e "Generating Report..\r"
HEADER="|--|---|--|---|--|--|---|----|----|----|----|"
PLACEHOLDER="|obj_id|filename|meta_addr|permissions|--|--|size|ctime|atime|--|mtime|"
sudo docker exec investigate tsk_gettimes -i raw /opt/autopsy/images/usb-image.dd > output.md

sed -i '1 a "$PLACEHOLDER"' output.md
sed -i 'a "$HEADER"' output.md
