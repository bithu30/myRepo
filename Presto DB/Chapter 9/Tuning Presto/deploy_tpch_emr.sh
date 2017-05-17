for dest in $(<nodes.txt); do
  scp -i ~/presto-screencast.pem tpch.properties hadoop@${dest}:~
  ssh -i ~/presto-screencast.pem hadoop@${dest} "sudo cp ~/tpch.properties /etc/presto/conf.dist/catalog/"
done
