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

## Travis scripts

You have these scripts you can use for Travis files

- **runTests.sh**
- **runPrograms.sh**

Both scripts first **build all .wlk files**, so even if your tests are passing, ensure you have no errors in `Problems` tab (in your Wollok IDE).

![](./images/wollokProblems.png)

### Example 1: running tests in a Wollok Project

If your Wollok project has several test files, your `.travis.yml` should look like this:

```yml
language: generic

sudo: required

script:
    - git clone https://github.com/uqbar-project/wollok-ci
    - mv wollok-ci/* ./
    - chmod 777 ./runTests.sh
    - ./runTests.sh
```

### Example 2: running a program inside a Wollok Project

If your Wollok project has no test file but a program, then your `.travis.yml` should look like this:

```yml
language: generic

sudo: required

script:
    - git clone https://github.com/uqbar-project/wollok-ci
    - mv wollok-ci/* ./
    - chmod 777 ./runTests.sh
    - ./runPrograms.sh
```

## Update Wollok versions

## How it works

- Building wlk files (even if there are no tests)
- Running tests or programs

## Tests

Having https://github.com/wollok/introPepita as a witness case,

- [ ]: not compiling 
- [ ]: missing imports or bad parsing
- [ ]: compiling with validation errors like `if (2 == 3) return false else true`
- [x]: tests failing with assertion errors
- [ ]: test failing with runtime errors (like `division by zero` or `null` parameters in operations like `+`)
- [ ]: passing tests

## Future steps

- [ ]: Migrate to Wollok Server Architecture in Amazon?
