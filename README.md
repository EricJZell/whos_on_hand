### Who's on Hand
* Get the ip address of your Raspberry pi (192.168.0.9)

* To get physical wireless interfaces on your pi:
  `$ iw dev`
 
* Add a monitor type wifi interface with
  `$ sudo iw phy phy0 interface add mon0 type monitor`

* Then down the managed mode interface and up the monitor mode interface:
  `$ sudo ifconfig wlan0 down`
  `$ sudo ifconfig mon0 up`


*Then listen for packets to/from known MAC addresses with:
  `$ sudo tcpdump -e -i mon0 | egrep '(5b:b8|69:74|...other known mac addresses)' >> tcp_packets.txt` (edited)

* Run the script on the raspberry pi that parses tcp_packets.txt and sends post request to your web server
