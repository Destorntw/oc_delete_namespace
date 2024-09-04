#!/bin/bash

# Get all namespaces that match the term
namespaces=$(oc get ns | grep -I term | awk '{print $1}')

# Check if any namespaces were found
if [ -z "$namespaces" ]; then
    echo "No namespaces found matching the term."
    exit 1
fi

# Iterate over each namespace and perform the operations
for ns in $namespaces; do
    echo "Processing namespace: ${ns}"  # Use ${ns} to ensure correct expansion

    # Check if the namespace exists and process it
    oc get namespace "$ns" -o json > tmp.json
    if [ -s tmp.json ]; then
        echo "Found namespace: ${ns}"
        sed -i '/"            \"kubernetes\""/d' tmp.json
        nohup oc proxy &
        pid=$!
        sleep 3
        curl -k -H "Content-Type: application/json" -X PUT --data-binary @tmp.json "http://127.0.0.1:8001/api/v1/namespaces/${ns}/finalize"
        kill -9 $pid
    else
        echo "Namespace ${ns} not found or no output from oc get namespace."
    fi

    # Cleanup
    rm -f tmp.json
    rm -f nohup.out
done
