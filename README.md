# Spatial Sound Localization based

This Localization system is based on Marvelmind Localization System. Localization system can be communicated through UDP and USB methods. In most situations, UDP is preferred due to it's easy to use and low latency.

## Download & Run Sample Code
The python scripts being used to communicate with the localization server(the machine runs Marvelmind dashboard) are in py_scripts folder.

### bootstrap
1. Install python 3. Python 3 or above is recommended.
https://www.python.org/downloads/
2. After installing python 3, install the _crcmod_. In terminal:
```
pip3 install crcmod
```
3. Download the Dashboard from Marvelmind website and lauch it. Open menu `File -> Parameters`, then set the UDP listening port on the host server which connecting the modem(the one without battery). After setting the listening port, restart the dashboard. You can use `netstat -an` to check whether the program is listening on the port you just set.

### localization through UDP
UDP connection is recommended in this localization system. Python script py_scripts/udpclient.py provides all the interface for UDP communication. `udp_factory(ip, port, beacon_add)` will initialize a UDP connection. During the udp session, `request_position(self)` will return the _(x, y, z)_ coordinates. Before exit the program, use `close(self)` to close the connection. There is an example code _localization_udp_example.m_ in **example** folder which can be followed to learn how to use the relative python scripts.  
