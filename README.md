# Formatting

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/Peter-Herrmann/formatting/blob/main/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/Peter-Herrmann/formatting)](https://github.com/Peter-Herrmann/formatting/issues)

## Overview

This GitHub Action applies Clang-Format to any C/C++ code based on my custom `.clang-format` file. You can specify the directories to which the formatting should be applied, making it a flexible solution for different project structures.

## Features

- Reusable across multiple repositories.
- Ability to specify target directories for formatting.

## Prerequisites

- Docker installed (for local testing).
- A GitHub repository with C/C++ code.

## Usage

### Step 1: Add this Action to your Repository

Create a new file in your repository under `.github/workflows`, for example `.github/workflows/clang-format.yml`, and add the following content:

```yaml
name: Run Clang-Format

on: [push, pull_request]

jobs:
  format:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    
    - name: Run Clang-Format
      uses: Peter-Herrmann/formatting/clang-format@main
      with:
        directories: 'src include' # If desired, specify directories to run format in
```

### Step 2: Push Changes

Commit and push this file to your repository. In this example the action will run on every `push` and `pull_request` event.

## Inputs

### `directories`

- **Optional**
- **Default**: `'.'`
- **Description**: A space-separated list of directories where you want to apply formatting. For example, `'src include'`.

## Local Testing

To test this action locally, you can build the Docker image and run it:

```bash
docker build -t clang-format .
docker run -v $(pwd):/github/workspace clang-format
```
