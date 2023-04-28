# oci-arm-host-capacity
<div align=left>   
  <img src="https://img.shields.io/badge/docker-2496ED?style=flat-square&logo=docker&logoColor=white">
  <img src="https://img.shields.io/badge/RHEL-EE0000?style=flat-square&logo=red hat&logoColor=white">
  <img src="https://img.shields.io/badge/oraclecloud-F80000?style=flat-square&logo=icloud&logoColor=white">
  <br>
  <br>  
</div>

Make [hitrov/oci-arm-host-capacity](https://github.com/hitrov/oci-arm-host-capacity) docker. The capacity was minimized based on alpine.

* * *

### Configuration

Change permissions o*******@oci_api_key.pem;
```sh
sudo chmod 600 /data/oci-arm-host-capacity/o*******@@oci_api_key.pem;
```

Edit o*******@oci_api_key.pem;
```txt
-----BEGIN PRIVATE KEY-----
same as hitrov/oci-arm-host-capacity configuration
-----END PRIVATE KEY-----
```

Edit .env
```txt
same as hitrov/oci-arm-host-capacity configuration
```

* * *

### How to use

Build docker image.

```sh
sudo docker build -t oci-arm-host-capacity /data/oci-arm-host-capacity/dockerfile
```

Below is an example running using docker. Used as @reboot in a scheduler such as crontab. Activates once every 10 seconds.
```sh
#!/bin/bash
log_file=/tmp/oci.log
while :
do
  docker run -i --rm --name=oci-arm-host-capacity --user=0:0 --expose 80/tcp \
  -e TZ=Asia/Seoul \
  -v /data/oci-arm-host-capacity/o*******@oci_api_key.pem:/opt/oci-arm-host-capacity/o*******@oci_api_key.pem:ro \
  -v /data/oci-arm-host-capacity/.env:/opt/oci-arm-host-capacity/.env:ro \
  oci-arm-host-capacity:latest \
  php81 /opt/oci-arm-host-capacity/index.php > $log_file
sleep 10
done
~
```

Run it once a day using a scheduler such as crontab. When the A1 instance is created, it is transmitted through telegram.
```sh
#!/bin/bash
log_file_1=/tmp/oci_notify.log
log_file_2=/tmp/oci_notify_telegram.log
docker run -i --rm --name=oci-arm-host-capacity-notify --user=0:0 --expose 80/tcp \
-e TZ=Asia/Seoul \
-v /data/oci-arm-host-capacity/o*******@oci_api_key.pem:/opt/oci-arm-host-capacity/o*******@oci_api_key.pem:ro \
-v /data/oci-arm-host-capacity/.env:/opt/oci-arm-host-capacity/.env:ro \
oci-arm-host-capacity:latest \
php81 /opt/oci-arm-host-capacity/index.php > $log_file_1
tail -n 4 /tmp/oci_notify.log | while read -r line
do
  if [[ $line == *"message"* ]]; then
    if [[ $line != *"Too many requests for the user"* && $line != *"Out of host capacity."* ]]; then
      {
        echo "$0"
        echo "$line"
      } > $log_file_2
      log=$(< $log_file_2 tail -c 4096)
      if [ -z "$log" ]; then
        exit 1
      fi
      /usr/bin/curl --data-urlencode text="$log" https://api.telegram.org/bot**********************************************/sendMessage?chat_id=**********
    fi
  fi
done
```

* * *

### Troubleshoot

May be caused by vcn changed. Check subnet id changed in .env.
```json
"code": "NotAuthorizedOrNotFound",
"message": "Authorization failed or requested resource not found."
```

* * *

### Contact and license

<a href="mailto:xqbty8po-dntco43u@yahoo.com" target="_blank"><img src="https://img.shields.io/badge/yahoo!-6001D2?style=flat-square&logo=yahoo!&logoColor=white"/></a>
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
