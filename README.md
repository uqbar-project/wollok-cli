![](images/wollokCI.png)

# Wollok Continuous Integration Project

[![Build Status](https://travis-ci.org/uqbar-project/wollok-ci.svg?branch=master)](https://travis-ci.org/uqbar-project/wollok-ci)

The main purpose of this project is to allow Wollok developers to have a simple CI workflow.

## Structure

The root folder provides all Wollok executable files in bash:

- **wast.sh**: AST Analyzer
- **wchecker.sh**: Wollok validations checker
- **winterpreter.sh**: Wollok Interpreter, it will run tests & programs
- **wrepl.sh**: interactive console is also available
- and server scripts

There is also a `jars` folder, where we put all necessary Java jar files in order to run in a standalone computer without installing the whole Wollok development environment.

## Update Wollok versions

## How it works

## Future steps

- [ ]: Tests all kind of situations ==> https://github.com/wollok/introPepita (not compiling - missing imports or bad parsing, compiling with validation errors like if (2 == 3) return false else true, tests failing with assertion errors, test failing with runtime errors (like division by zero or null parameters in operations like +), passing tests)
- [ ]: Enhance scripts (avoid duplicated code)
- [ ]: Migrate to Wollok Server Architecture in Amazon?
