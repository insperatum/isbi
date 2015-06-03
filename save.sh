echo SAVING...
(cat ~/spark-ec2/slaves) | (tasks=""; while read line; do
 ssh -n -o StrictHostKeyChecking=no -t -t root@$line "source aws-credentials && aws s3 cp /mnt/neuroproof_predictions/ s3://neuronforest.sparkdata/neuroproof_predictions --recursive" &
        tasks="$tasks $!"; done; for t in $tasks; do wait $t; done);
        source aws-credentials && aws s3 cp /mnt/neuroproof_predictions/ s3://neuronforest.sparkdata/neuroproof_predictions --recursive
        source aws-credentials && aws s3 cp /mnt/neuroproof_models/ s3://neuronforest.sparkdata/neuroproof_models --recursive
