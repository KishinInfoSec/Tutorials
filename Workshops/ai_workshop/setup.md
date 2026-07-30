# Workshop: Docker Compose Baseline Environment

### This document contains the configuration for the standardized development environment used in the "From Prompt to Production" workshop. We use Docker to ensure every attendee has the exact same setup, eliminating "it works on my machine" issues.

## Instructions for Attendees

 1. Create a new directory for your workshop project.

 2. Create a file named compose.yaml in that directory.

 3. Copy the configuration below and paste it into the compose.yaml file

 4. Open your terminal, navigate to the directory, and run: 'docker compose up -d'

## Docker Compose Configuration
### Note: This is a basic Python environment suitable for the AI agent exercises in the workshop.

### Verifying the Environment

Once the container is running, you can execute commands inside it. Try running:

```
docker exec -it workshop:01 cat /etc/issue
```

You should see the OS version print to the screen
