source ~/isbi/subvolumes.sh
for i in `seq 1 5`; do ~/isbi/init.sh init037 $SUBVOLUMES_TRAIN_FULL -7,-3,0,3,7 5 20 20 sqrt ; done

