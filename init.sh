if [ -z "$6" ]; then echo "Please give 6 arguments:"; echo "name, dimOffsets, initialTrees, maxDepth, maxBins, featureSubsetStrategy"; exit 1; fi

~/isbi/clear.sh;
dt=$(date '+%Y%m%d_%H%M%S');
~/spark/bin/spark-submit --executor-memory 28G --driver-memory 120G --conf spark.shuffle.spill=false --conf spark.shuffle.memoryFraction=0.1 --conf spark.storage.memoryFraction=0.7 --master spark://`cat ~/spark-ec2/masters`:7077 --class Main ./neuronforest-spark.jar name=$1 numExecutors=64 maxMemoryInMB=2500 data_root=/mnt/data localDir=/mnt/tmp master= subvolumes_train=.*64 subvolumes_test=.*64 dimOffsets=$2 learningRate=1 initialTrees=$3 save_to=/mnt/neuroproof_predictions save_model_to=/mnt/neuroproof_models treesPerIteration=10 iterations=0 maxDepth=$4 testPartialModels=none testDepths= maxBins=$5 useNodeIdCache=false subsampleProportion=1 momentum=0 offsetMultiplier=1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,4,4,4,4,4,4,4,4,4,4 featureSubsetStrategy=$6 > "/root/logs/$dt stdout.txt" 2> "/root/logs/$dt stderr.txt" &&
~/isbi/save.sh
