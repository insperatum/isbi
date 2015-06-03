if [ -z "$5" ]; then echo "Please give 5 arguments:"; echo "loadModel, dimOffsets, maxBins, featureSubsetStrategy, testPartialModels"; exit 1; fi
~/isbi/clear.sh;
dt=$(date '+%Y%m%d_%H%M%S');
~/spark/bin/spark-submit --executor-memory 28G --driver-memory 120G --conf spark.shuffle.spill=false --conf spark.shuffle.memoryFraction=0.1 --conf spark.storage.memoryFraction=0.7 --master spark://`cat ~/spark-ec2/masters`:7077 --class Main ./neuronforest-spark.jar numExecutors=64 maxMemoryInMB=2500 data_root=/mnt/data localDir=/mnt/tmp master= subvolumes_train=.*64 loadModel=$1 dimOffsets=$2 maxBins=$3 featureSubsetStrategy=$4 testPartialModels=$5 iterations=0 learningRate=0 maxDepth=999 subsampleProportion=0 subvolumes_test=.*64 save_to=/mnt/neuroproof_predictions save_model_to= treesPerIteration=0 testDepths= useNodeIdCache=false momentum=0 offsetMultiplier=1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,4,4,4,4,4,4,4,4,4,4 > "/root/logs/$dt stdout.txt" 2> "/root/logs/$dt stderr.txt" &&
~/isbi/save.sh
