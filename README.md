# Node2Vec Classification Example

## Overview

The purpose of this repo is to define some patterns and best practices for building out a training codebase.

It contains code demonstrating:

- Using google storage buckets as data sources
- Triggering AI Platform runs
- Using MLFlow for experiment tracking
- Building Docker Images for training tasks

--- Not yet Implemented ---

- Using hyperparameter Tuning for training models
- Using PyTorch to to train models

## Usage

To start a training **locally**, from the project directory, run:

```bash
./scripts/train_local.sh
```

To start a training **on the cloud**, from the project directory, run:

```bash
./scripts/train_cloud.sh
```

To start a training on the cloud **with hyperparameter tuning**, from the project directory, run:

```bash
./scripts/train_hptuning.sh
```

hyperparameters to tune can be configured in `scripts/hptuning.yml`
