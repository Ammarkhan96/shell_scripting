#!/bin/bash

# Script to check if any Kubernetes pods are in a 'Running' state.

echo "--- Checking for Running Kubernetes Pods ---"

# Use kubectl to get the status of all pods and filter for 'Running' state.
# We use --all-namespaces to check across all namespaces.
running_pods=$(kubectl get pods --all-namespaces -o=jsonpath='{.items[?(@.status.phase=="Running")].metadata.name}')

# Check if variable 'running_pods' is empty or not.
if [ -z "$running_pods" ]; then
	echo "❌ No Kubernetes pods are currently in the 'Running' state."
      else 
	echo "✅ Found the following Kubernetes pods in 'Running' state:"
	echo "$running_pods"
fi

echo "---------------------------------------------------"

exit 0
