FROM python:3.11-slim

# Set working directory
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && \
    apt-get install -y git curl tree && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Copy dotfiles from the cloned repository
COPY .devcontainer/dotfiles/.gitconfig /home/$USERNAME/.gitconfig
COPY .devcontainer/dotfiles/.bashrc /home/$USERNAME/.bashrc
RUN chown -R $USERNAME:$USERNAME /home/$USERNAME

# Set bash as default shell
SHELL ["/bin/bash", "-c"]
ENV SHELL=/bin/bash

# Install Python tools
RUN pip install --upgrade pip \
    && pip install pylint black ipython

# Switch to non-root user
USER $USERNAME

# Add .local/bin to PATH
ENV PATH="${PATH}:/home/${USERNAME}/.local/bin"
