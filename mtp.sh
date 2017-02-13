#!/bin/bash
su anton -c "export DISPLAY=:0; bash -c '/etc/udev/rules.d/sp/mtp1.sh $1 $2'"

