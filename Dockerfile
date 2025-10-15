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

USER coder
WORKDIR /home/coder/projects
EXPOSE 8080

CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none", "/home/coder/projects"]
