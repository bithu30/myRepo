for dest in $(<nodes.txt); do
  ssh -i presto-screencast.pem hadoop@${dest} "sudo restart presto-server"
done
