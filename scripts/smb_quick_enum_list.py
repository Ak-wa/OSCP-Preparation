#!/usr/local/bin/python3
# needs smb_quick_enum.sh in the same path
# Usage: smb_quick_enum_list.py <list_of_hosts.txt>
import os,sys

if len(sys.argv) <= 1:
    print('Please specify target list')
    print('smb_quick_enum_list.py <target_list>')
    exit(1)

with open(sys.argv[1]) as target_list:
    for target in target_list:
        target = target.rstrip()
        os.system(f"bash smb_quick_enum.sh {target}")
        print("-"*150)
