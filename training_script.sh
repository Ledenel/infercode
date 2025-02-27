MODEL_NAME=stmt
DATASET=java-small
ROOT=java-data
TRAIN_PATH=${ROOT}/${DATASET}_pkl/training
VAL_PATH=rosetta_sample_pkl/Inheritance-Multiple
TRAIN_LABEL_PATH=${ROOT}/${DATASET}_${MODEL_NAME}/training
VAL_LABEL_PATH=rosetta_sample_subtrees/Inheritance-Multiple
NODE_TYPE_VOCAB_PATH=vocab/${DATASET}/type_vocab.csv
NODE_TOKEN_VOCAB_PATH=vocab/${DATASET}/token_vocab.csv
SUBTREE_FEATURES_PATH=subtree_features/${DATASET}_${MODEL_NAME}_features_train.csv
BATCH_SIZE=1
WORKER=2
CHECKPOINT_EVERY=1000
TREE_SIZE_THRESHOLD_UPPER=5000
TREE_SIZE_THRESHOLD_LOWER=10
CUDA=0
VALIDATING=1
NODE_TYPE_DIM=30
NODE_TOKEN_DIM=30
CONV_DIM=50
NUM_CONV=1
TASK=0
INCLUDE_TOKEN=1
EPOCH=20
PYTHON=python3
${PYTHON} training_script.py \
--train_path ${TRAIN_PATH} --val_path ${VAL_PATH} --train_label_path ${TRAIN_LABEL_PATH} --val_label_path ${VAL_LABEL_PATH} \
--subtree_vocabulary_path ${SUBTREE_FEATURES_PATH} --cuda ${CUDA} \
--batch_size ${BATCH_SIZE} --checkpoint_every ${CHECKPOINT_EVERY} \
--node_type_dim ${NODE_TYPE_DIM} --node_token_dim ${NODE_TOKEN_DIM} \
--num_conv ${NUM_CONV} \
--node_type_vocabulary_path ${NODE_TYPE_VOCAB_PATH} \
--token_vocabulary_path ${NODE_TOKEN_VOCAB_PATH} \
--task ${TASK} --epochs ${EPOCH} --worker ${WORKER} \
--model_name ${MODEL_NAME} --include_token ${INCLUDE_TOKEN} --output_size ${CONV_DIM} --dataset ${DATASET} \
--tree_size_threshold_upper ${TREE_SIZE_THRESHOLD_UPPER} --tree_size_threshold_lower ${TREE_SIZE_THRESHOLD_LOWER}