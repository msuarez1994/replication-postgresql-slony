#!/bin/sh
source config.txt
slonik <<_EOF_
        cluster name=$CLUSTERNAME;
        node 1 admin conninfo = 'dbname=$MASTERDBNAME host=$MASTERHOST port=$PORTMASTER user=$REPLICATIONUSER password=$MASTERPASSWORD';
        node 2 admin conninfo = 'dbname=$SLAVEDBNAME host=$SLAVEHOST port=$PORTSLAVE user=$REPLICATIONUSER password=$SLAVEPASSWORD';

        init cluster (id=1, comment = 'master');
        store node (id = 2, comment = 'slave1', EVENT NODE = 1);

        store path (server = 1, client = 2, conninfo = 'dbname=$MASTERDBNAME host=$MASTERHOST port=$PORTMASTER user=$REPLICATIONUSER password=$MASTERPASSWORD');
        store path (server = 2, client = 1, conninfo = 'dbname=$SLAVEDBNAME host=$SLAVEHOST port=$PORTSLAVE user=$REPLICATIONUSER password=$SLAVEPASSWORD');

        # LISTA DE TABLAS A REPLICAR
        create set (id=1, origin=1, comment='tablas del Catalogo  Set 1 ');
        # set add table (set id=1, origin=1, id=1, full qualified name='public.employe');
        
        subscribe set (id=1, provider=1, receiver=2, forward=yes);
        echo 'El nodo 1 esta suscrito al set 1, proveedor es nodo 1';
_EOF_