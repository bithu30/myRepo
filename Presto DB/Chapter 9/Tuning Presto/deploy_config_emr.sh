for dest in $(<nodes.txt); do
  scp -i ~/presto-screencast.pem config.properties hadoop@${dest}:~
  ssh -i ~/presto-screencast.pem hadoop@${dest} "sudo cp ~/config.properties /etc/presto/conf.dist/"
done
