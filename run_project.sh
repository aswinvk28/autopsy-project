echo -e "Generating Report..\r"
IMAGE_PATH=$1
OUTPUT_FILENAME=$2
PLACEHOLDER="--|---|--|---|--|--|---|----|----|----|----"
HEADER="|obj_id|filename|meta_addr|permissions|--|--|size|ctime|atime|--|mtime|"
sudo docker exec investigate tsk_gettimes -i raw $IMAGE_PATH > $OUTPUT_FILENAME

echo -e "$HEADER\n$(cat output.md)" > $OUTPUT_FILENAME
sed -i "1 a $PLACEHOLDER" $OUTPUT_FILENAME
