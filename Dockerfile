FROM codercom/code-server:4.90.1


USER coder

# Install extensions
RUN code-server --install-extension ms-python.python
RUN code-server --install-extension saoudrizwan.claude-dev

# Switch to root to install system packages
USER root

# Install Python, Node.js, Git
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    nodejs \
    npm \
    git \
    && rm -rf /var/lib/apt/lists/*

# Switch back to coder user
USER coder

# Set working directory
WORKDIR /home/coder/projects

# Expose port
EXPOSE 8080
