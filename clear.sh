echo CLEARING...
rm -rf /mnt/isbi_models; rm -rf /mnt/isbi_predictions;
(cat ~/spark-ec2/slaves) | (while read line; do
 ssh -n -o StrictHostKeyChecking=no -t -t root@$line "rm -rf /mnt/isbi_predictions" & 
  tasks="$tasks $!"; done; for t in $tasks; do wait $t; done);
  mkdir /root/logs
