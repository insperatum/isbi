echo CLEARING...
rm -rf /mnt/neuroproof_models; rm -rf /mnt/neuroproof_predictions;
(cat ~/spark-ec2/slaves) | (while read line; do
 ssh -n -o StrictHostKeyChecking=no -t -t root@$line "rm -rf /mnt/neuroproof_predictions" & 
  tasks="$tasks $!"; done; for t in $tasks; do wait $t; done);
  mkdir /root/logs
