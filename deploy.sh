#!/bin/bash
set -e

echo "Starting Jira..."
docker compose -f jira/docker-compose.yml up -d

echo "Starting Portainer..."
docker compose -f portainer/docker-compose.yml up -d

echo "All services started."