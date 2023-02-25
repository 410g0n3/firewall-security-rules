/ip firewall filter
add action=add-src-to-address-list address-list="Escaner de Puertos" \
    address-list-timeout=2w chain=input comment=\
    "Listar como escaner de puertos" protocol=tcp psd=21,3s,3,1
add action=add-src-to-address-list address-list="Escaner de Puertos" \
    address-list-timeout=2w chain=input comment="Escaneo de sigilo NMAP FIN" \
    protocol=tcp tcp-flags=fin,!syn,!rst,!psh,!ack,!urg
add action=add-src-to-address-list address-list="Escaner de Puertos" \
    address-list-timeout=2w chain=input comment="Escaner SYN/FIN" protocol=\
    tcp tcp-flags=fin,syn
add action=add-src-to-address-list address-list="Escaner de Puertos" \
    address-list-timeout=2w chain=input comment="Escaner SYN/RST" protocol=\
    tcp tcp-flags=syn,rst
add action=add-src-to-address-list address-list="Escaner de Puertos" \
    address-list-timeout=2w chain=input comment="Escaner FIN/PSH/URG" \
    protocol=tcp tcp-flags=fin,psh,urg,!syn,!rst,!ack
add action=add-src-to-address-list address-list="Escaner de Puertos" \
    address-list-timeout=2w chain=input comment="Escaner TODO/TODO" protocol=\
    tcp tcp-flags=fin,syn,rst,psh,ack,urg
add action=drop chain=input comment="Denegando escaners de puertos" fragment=\
    no in-interface=0-PPPoE_nadunet psd=21,3s,3,1 src-address-list=\
    "Escaner de Puertos"
