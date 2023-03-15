# venice-helm-chart

A Helm Chart for LinkedIn Venice. 

# Deploying on K8S

TODO

# Creating a store

Login into the venice-client pod and run

cd /opt/venice/bin
./create-store.sh http://venice-controller:5555 venice-cluster0 test sample-data/schema/keySchema.avsc sample-data/schema/valueSchema.avsc