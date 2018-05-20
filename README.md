# cookiecutter-docker-stacks

A template for creating a community maintained Jupyter Docker Stack image
with initial image build and test automation on Travis and final build and
image registration on Docker Cloud.

### Create a Project

Follow these steps to create a new project skeleton and get it pushed
to a new GitHub repository.

```
# Install the cookiecutter utility using pip or conda
pip install cookiecutter   # conda install cookiecutter

# Run the cookiecutter command pointing to this project on GitHub.
cookiecutter https://github.com/jupyter/cookiecutter-docker-stacks.git

# Enter a name for the stack image. This will serve as both the git repository
name and the part of the Docker image name after the slash.
stack_name [my-jupyter-stack]:

# Enter the user or organization name under which this stack will reside on
# Docker Cloud / Hub. You must have access to manage this Docker Cloud org in
# order to push images here and setup automated builds.
stack_org [my-project]:

# Select an image from the jupyter/docker-stacks project that will serve as the
# base for your new image.
stack_base_image [jupyter/base-notebook]:

# Enter a longer description of the stack for your README.
stack_description [my-jupyter-stack is a community maintained Jupyter Docker Stack image]:

# Switch to the project directory
cd <stack_name you chose>

# Setup git
git init
git add .
git commit -m 'Seed repo'
git remote add origin <url from github>
git push -u origin master
```

## Setup Travis

## Setup Docker Cloud

## Share Your Image