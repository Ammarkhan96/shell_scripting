#!/bin/bash

echo "--- Checking for Running Clusters ---"

# Check for common Kubernetes tools and processes
echo "Checking for Kubernetes..."
if command -v kubectl >/dev/null 2>&1; then
  echo "✅ 'kubectl' command found. Kubernetes might be installed."
  # Basic check for running Kubernetes nodes
  kubectl get nodes --no-headers 2>/dev/null | grep Ready
  if [ $? -eq 0 ]; then
    echo "   ✅ Found 'Ready' Kubernetes nodes."
  else
    echo "   ⚠️ No 'Ready' Kubernetes nodes found (or cluster not accessible)."
  fi
else
  echo "❌ 'kubectl' command not found. Kubernetes is likely not installed or not in your PATH."
fi

echo ""

# Check for Minikube (local Kubernetes)
echo "Checking for Minikube..."
if command -v minikube >/dev/null 2>&1; then
  echo "✅ 'minikube' command found. Minikube might be installed."
  # Check Minikube status
  minikube status 2>/dev/null | grep "State: Running"
  if [ $? -eq 0 ]; then
    echo "   ✅ Minikube cluster is running."
  else
    echo "   ⚠️ Minikube cluster is not running (or not accessible)."
  fi
else
  echo "❌ 'minikube' command not found. Minikube is likely not installed or not in your PATH."
fi

echo ""

# Check for Docker Swarm (another container orchestration tool)
# Check for Docker Swarm (another container orchestration tool)
echo "Checking for Docker Swarm..."
if command -v docker >/dev/null 2>&1; then
    # Check if Docker is in Swarm mode or if there are active Swarm managers
    docker info 2>/dev/null | grep "Swarm: active"
    if [ $? -eq 0 ]; then
        echo "   ✅ Docker Swarm is active."
    else
        docker node ls 2>/dev/null | grep Manager
        if [ $? -eq 0 ]; then
            echo "   ✅ Found Docker Swarm manager. Swarm might be running."
        else
            echo "   ⚠️  Docker Swarm is not active, and no managers found."
        fi
    fi
else
    echo "❌ 'docker' command not found. Docker needs to be installed to use Swarm."
fi

echo ""
echo "Note:"
echo "This script performs basic checks by looking for common command-line tools and"
echo "the status of known local cluster managers (Minikube)."
echo "For comprehensive cluster detection, especially in remote or managed environments,"
echo "you might need to use specific cloud provider CLIs (like 'aws eksctl', 'gcloud container', 'az aks')."

exit 0
