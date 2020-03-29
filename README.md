## An autopsy project that includes imaging a usb drive and retrieving a report from the drive

![Disk-Imaging.gif](./Disk-Imaging.gif)

It is safer to perform investigation on a Mac or Windows OS because Windows platforms do provide hardware write protection while performing disk imaging on computer hard disk drives. Linux based operating systems do have software write protection. If you have systems such as USB stick containing Linux OS, that is safer to use in case of Linux. 

## Imaging the USB drive

```bash

sudo ./dcfldd-1.3.4-1/dcfldd if=/dev/sdc1 of=./images/usb-image.dd conv=noerror,sync bs=4096

```

## Installing dcfldd

```bash

wget http://prdownloads.sourceforge.net/dcfldd/dcfldd-1.3.4-1.tar.gz?download

./configure
make install

```

## Running autopsy

docker-compose up -d --build
