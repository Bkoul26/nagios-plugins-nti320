#!/bin/bash
state=$(systemctl status rsyslog | awk '{print $2}')
active="active"
inactive="inactive"
failed="failed"



if [systemctl status rsyslog | grep -c Active = 1]; then
    echo "STATUS: UP"
    exit 0;
elif [systemctl status rsyslog | grep -c Inactive = 1]; then
    echo "STATUS: WARNING"
    exit 1;
elif [systemctl status rsyslog | grep -c Failed = 1]; then
    echo "STATUS: CRITICAL"
    exit 2;
else
    echo "STATUS: UNKNOWN"
    exit 3;
#end
