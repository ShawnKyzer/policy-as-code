# Policy-as-Code Tutorial with Open Policy Agent (OPA)

This repository contains basic exercises and examples for learning and implementing Policy-as-Code concepts using Open Policy Agent (OPA). It's designed to provide hands-on experience with policy enforcement using Rego, OPA's native query and policy language.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Exercises](#exercises)
- [Using OPA](#using-opa)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Policy-as-Code is an approach to policy management where policies are defined, updated, and version controlled using code. This tutorial repository aims to help you understand and implement basic Policy-as-Code practices using Open Policy Agent (OPA), focusing on Role-Based Access Control (RBAC) and Policy-Based Access Control (PBAC).

## Prerequisites

Before you begin, ensure you have the following installed:

- [Open Policy Agent (OPA)](https://www.openpolicyagent.org/docs/latest/#1-download-opa)
- Git

## Getting Started

To get started with this project, follow these steps:

1. Clone the repository:
   ```
   git clone https://github.com/shawn/policy-as-code.git
   ```

2. Navigate to the project directory:
   ```
   cd policy-as-code
   ```

3. Verify OPA installation:
   ```
   opa version
   ```

## Project Structure

The repository is organized as follows:

```
policy-as-code/
├── exercises/
│   ├── pbac/
│   │   ├── pbac.rego
│   │   ├── _data.json
│   │   └── _input.json
│   └── rbac/
│       ├── rbac.rego
│       ├── _data.json
│       └── _input.json
├── presentation/
├── LICENSE
└── README.md
```

- `exercises/`: Contains subdirectories for different policy exercises.
- `presentation/`: Reserved for presentation materials related to the project.
- `LICENSE`: The license file for the project.
- `README.md`: This file, providing an overview of the project.

## Exercises

The repository includes two main types of exercises:

1. **RBAC (Role-Based Access Control)**: Located in `exercises/rbac/`.
2. **PBAC (Policy-Based Access Control)**: Located in `exercises/pbac/`.

Each exercise directory contains:
- A `.rego` file with the policy definitions.
- A `_data.json` file with the policy data.
- An `_input.json` file with sample inputs for testing the policies.

To work on these exercises, open the respective `.rego` files and follow the instructions provided in the comments.

## Using OPA

To evaluate policies using OPA:

1. Navigate to an exercise directory:
   ```
   cd exercises/rbac
   ```

2. Run OPA evaluation:

   Before running the evaluation, ensure OPA is installed:

   - For macOS (using Homebrew):
     ```
     brew install opa
     ```

   - For Linux (using the install script):
     ```
     curl -L -o opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64
     chmod 755 ./opa
     sudo mv opa /usr/local/bin
     ```

   - For Windows (using Chocolatey):
     ```
     choco install opa
     ```

   After installation, verify OPA is correctly installed:
   ```
   opa version
   ```
    This line demonstrates how to use the OPA command-line interface to evaluate a policy.

    ```markdown
    opa eval -d rbac.rego -d rbac_data.json -i rbac_input.json "data.app.rbac.allow"
    ```
    Let's break it down:
    - `opa eval`: This is the command to evaluate a policy using OPA.
    - `-d rbac.rego`: Specifies the Rego policy file to use.
    - `-d rbac_data.json`: Provides the data file containing role and permission information.
    - `-i rbac_input.json`: Specifies the input file with the request details to evaluate.
    - `"data.app.rbac.allow"`: This is the query to evaluate. It checks if the `allow` rule in the `app.rbac` package evaluates to true given the input and data.

    This command will return the result of the policy evaluation, indicating whether the specified action is allowed based on the RBAC policy, data, and input provided.

For more information on using OPA, refer to the [OPA Documentation](https://www.openpolicyagent.org/docs/latest/).



## Contributing

Contributions to improve the exercises or add new ones are welcome. Please feel free to submit pull requests or open issues for any suggestions or problems you encounter.
