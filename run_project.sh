echo -e "Generating Report..\r"
PLACEHOLDER="--|---|--|---|--|--|---|----|----|----|----"
HEADER="|obj_id|filename|meta_addr|permissions|--|--|size|ctime|atime|--|mtime|"
sudo docker exec investigate tsk_gettimes -i raw /opt/autopsy/images/usb-image.dd > output.md

echo -e "$HEADER\n$(cat output.md)" > output.md
sed -i "1 a $PLACEHOLDER" output.md
