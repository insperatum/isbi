if [ -z "$8" ]; then echo "Please give 9 arguments:"; echo "subvolumes_train, loadModel, dimOffsets, maxBins, iterations, learningRate, maxDepth, subsampleProportion, featureSubsetStrategy"; exit 1; fi
source ~/isbi/subvolumes.sh
~/isbi/clear.sh;
dt=$(date '+%Y%m%d_%H%M%S');
~/spark/bin/spark-submit --executor-memory 28G --driver-memory 120G --conf spark.shuffle.spill=false --conf spark.shuffle.memoryFraction=0.1 --conf spark.storage.memoryFraction=0.7 --master spark://`cat ~/spark-ec2/masters`:7077 --class Main ./neuronforest-spark.jar numExecutors=36 maxMemoryInMB=2500 data_root=/mnt/isbi_data localDir=/mnt/tmp master= subvolumes_train=$1 loadModel=$2 dimOffsets=$3 maxBins=$4 iterations=$5 learningRate=$6 maxDepth=$7 subsampleProportion=$8 subvolumes_test=$SUBVOLUMES_TEST save_to=/mnt/isbi_predictions save_model_to=/mnt/isbi_models treesPerIteration=10 testPartialModels= testDepths= useNodeIdCache=false momentum=0 offsetMultiplier=1,1,1,1,1,1,2,2,2,2,2,2,4,4,4,4,4,4,8,8,8,8,8,8 featureSubsetStrategy=$9 > "/root/logs/$dt stdout.txt" 2> "/root/logs/$dt stderr.txt" &&
~/isbi/save.sh
