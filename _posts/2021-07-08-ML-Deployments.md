---
tags: deployment machine-learning
title: ML Deployments
---

I worked on a 3-person team to train and deploy a machine learning model to the cloud. I experimented with deployment for machine learning models. In order to deploy a handwritten digit classification model (prediction using the canonical MNIST dataset), I built a Flask API, containerized it using Docker, and deployed it on the Google Cloud Platform (GCP). I used GCP Cloud Run to deploy the containerized API service. I set up continuous integration and continuous delivery (CI/CD) using GCP Cloud Build, such that a push to the [GitHub repo](https://github.com/golubitsky/wake-word-app) results in a new build being deployed to the cloud. Inside of the Flask API, I wrote a thin service layer to serve the Tensorflow/Keras models. There is also a minimal UI to expose the optimal model.

## Integration contract during development

The purpose of defining an integration contract between multiple engineers is to enable each person to work independently and to minimize integration challenges. This is even more crucial on a larger team, where data scientists who develop models may not have the engineering expertise to deploy those models, and vice-versa. The integration contract that worked for us was that one engineer would develop a model and be responsible for the following deliverables:

1. The model artifact
2. A snippet of Python code to load the model and predict on a sample in an agreed-upon format/shape
3. Documentation of the model (e.g. hyperparameters, considerations for future enhancements)
4. Dependencies required to predict using the model

That way, another engineer working on the infrastructure to serve the model can work independently, with a relatively simple integration stage.

## Scaling

Larger models

At the moment, we commit the model to the source code. This works because our model size is small. However, this would not scale to larger model sizes and/or when we have many models to choose from. In that case, presumably we would explore the use of a Machine Learning Model Registry, such that we would store the model artifact in a NoSQL database somewhere, register the artifact, and, as it is booting up, have the Flask API retrieve the specific version of the model whose prediction is to be served.

## Multiple types of models

In our MVP phase, we worked with TensorFlow models only. If multiple types of model are to be served (for example scikit-learn and PyTorch models, in addition to the TensorFlow models), we might first write independent Prediction modules in our Flask API for each type of model, and if that becomes hard to manage, consider writing multiple API services, one for each type of model.

At this point, it is likely that a dedicated Model Registry will help significantly to both streamline the deployments as well as to keep track of each model version and its documentation.

If we have many different types of models, we will seek the right abstraction, so that we can deploy different models with minimal additional code and effort. These patterns would become evident as we develop and maintain multiple models in production.

## Architecture

### V1 (implemented)

![](https://drive.google.com/uc?export=view&id=1nXbPi4CjSNpUSII35Ff9BksL1_z3sPMJ)

### V2 (not yet implemented)

![](https://drive.google.com/uc?export=view&id=1wKOC7_SST8tcfmLJOse_HEJNsBYsSygA)
