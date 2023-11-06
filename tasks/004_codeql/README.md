# CodeQL Checks

[Codeql](https://codeql.github.com/) is a way to analyze and improve your code. It is generally used to find vulnerabilities on your code base, but it can also be used to find inefficiences in your code. Inefficiencies generally mean higher energy usage, which can reflect a higher CO2 output by your code. Find the setup below and try it

## Setup

```bash
# Setup CodeQL home
cd ~/
mkdir cql_home
cd cql_home
git clone git@github.com:github/codeql.git codeql-repo

# Download cql-cli
# https://github.com/github/codeql-cli-binaries/releases
* Linux: 
  * curl -LO https://github.com/github/codeql-cli-binaries/releases/download/v2.15.1/codeql-linux64.zip
  * unzip codeql-linux64.zip
* Mac: 
  * curl -LO https://github.com/github/codeql-cli-binaries/releases/download/v2.15.1/codeql-osx64.zip
  * unzip codeql-osx64.zip

# add to PATH
export PATH="$HOME/cql_home/codeql:$PATH"

# validate via
which codeql # -> $HOME/cql_home/codeql/codeql
codeql resolve languages # -> should list some langs, js for example ;)
```

## Prepare VS-Code
  * Install: https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-codeql
  * set codeql path in VS-Code: CodeQL CLI:Executable Path:
    * `which codeql` to find out your path
    * Open settings, set cli executable path for codeql

## Create a database

```bash
codeql database create cqldb \
  --language=javascript \
  --overwrite 
```

## Run it

* Import database via VScode plugin
* Run `>CodeQL: Run Query on Selected Database` on your query - for example codeql/

## Examples

* 000_unusedDep.ql
* 001_unnecessary_await.ql

## Alternative (because Codeql isn't cheap):

This page below uses eslint to calculate the co2 costs, and tries to optimize accordingly.

* https://ec0lint.com/features