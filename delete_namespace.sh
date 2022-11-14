ns=$1
if [ ! -z "$ns" ]
then
	echo "Starting Script"
	oc get namespace $ns -o json > tmp.json
	if [ -s tmp.json ]
	then
		echo "Found namespace: $ns"
		sed -i /"            \"kubernetes\""/d tmp.json
		nohup oc proxy &
		pid=$!
		sleep 3
		curl -k -H "Content-Type: application/json" -X PUT --data-binary @tmp.json http://127.0.0.1:8001/api/v1/namespaces/$ns/finalize
		kill -9 $pid
	fi
	rm -f tmp.json
	rm -f nohup.out
else
	echo "You need to enter a namespace name! :)"
fi