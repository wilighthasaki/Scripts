#!/bin/bash
# 管理ssh的地址和用户名密码。
# Written by Wenliang Shao
# 2017.8.20
stty erase ^H
sshutil_config_path='./sshutil.conf'
if [ ! -f "$sshutil_config_path" ] ; then
    touch "$sshutil_config_path"
fi

while getopts ":ad" opt
do
    case $opt in
        a)  read -p "Please enter the connection name:" conn_name
            read -p "Please enter the server IP:" ip_addr
            read -p "Please enter the username:" username
            read -p "Please enter the password:" password
            read -p "Please enter the port:" port
            echo "${conn_name} ${ip_addr} ${username} ${password} ${port}" >> $sshutil_config_path;;
        d)  i=0
            cat $sshutil_config_path | while read line
            do
                params=($line)
                echo -e "${i}) ${params[0]}\t${params[2]}@${params[1]}"
                ((i++))
            done
            read -p "Choose a server to delete:" d_num
            ((d_num++))
            sed -i ${d_num}'d' $sshutil_config_path;;

        h) echo "Use sshutil.sh -a to add a new server";;
    esac
done

if [ $# == 0 ] ; then
    # 输出所有server供选择
    i=0
    cat $sshutil_config_path | while read line
    do
        params=($line)
        echo -e "${i}) ${params[0]}\t${params[2]}@${params[1]}"
        ((i++))
    done

    read -p "Please choose a server to connect:" server_num
    ((server_num++))
    target_line=$(awk 'NR=='${server_num} ${sshutil_config_path})
    target_param=($target_line)
    sshpass -p ${target_param[3]} ssh -p ${target_param[4]} ${target_param[2]}@${target_param[1]} -o StrictHostKeyChecking=no
fi
