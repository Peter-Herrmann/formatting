# Formatting

[![GitHub license](https://img.shields.io/github/license/Peter-Herrmann/formatting)](https://github.com/Peter-Herrmann/formatting/blob/main/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/Peter-Herrmann/formatting)](https://github.com/Peter-Herrmann/formatting/issues)

## Overview

This GitHub Action applies Clang-Format to your C/C++ code based on your custom `.clang-format` file. You can specify the directories to which the formatting should be applied, making it a flexible solution for different project structures.

## Features

- Reusable across multiple repositories.
- Customizable formatting through your own `.clang-format` file.
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
        directories: 'src include' # Replace with your directories
