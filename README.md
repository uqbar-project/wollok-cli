<image src="./images/wollokCLILogo.png" height="20%" width="20%"/>

<!-- http://patorjk.com/software/taag/#p=display&f=Larry%203D&t=cli -->

# Wollok Command-Line Interface Project

[![Build Status](https://travis-ci.org/uqbar-project/wollok-cli.svg?branch=master)](https://travis-ci.org/uqbar-project/wollok-cli)

The main purpose of this project is to provide a command line interface (CLI) for Wollok developers & users, in order to foster any kind of automation (like CI workflow or developing bash scripts).

## Structure

The root folder provides all Wollok executable files in bash:

- **wast.sh**: AST Analyzer
- **wchecker.sh**: Wollok validations checker
- **winterpreter.sh**: Wollok Interpreter, it will run tests & programs
- **wrepl.sh**: interactive console is also available
- and server scripts

There is also a `jars` folder, where we put all necessary Java jar files in order to run in a standalone computer without installing the whole Wollok development environment.

## Travis integration & scripts

You have these scripts you can use for Travis files

- **runTests.sh**
- **runPrograms.sh**

Both scripts first **build all .wlk files**, so even if your tests are passing or your program is working fine, ensure you have no errors in `Problems` tab (in your Wollok IDE).

![image](images/wollokProblems.png)

Otherwise, your build will fail.

It then will run either all the tests files or all the programs. Any error prevents a succesful build to happen.

### Example 1: running tests in a Wollok Project

If your Wollok project has several test files, your `.travis.yml` should look like this:

```yml
language: generic

sudo: required

script:
    - git clone https://github.com/uqbar-project/wollok-cli
    - mv wollok-cli/* ./
    - chmod 777 ./runTests.sh
    - ./runTests.sh
```

### Example 2: running a program inside a Wollok Project

If your Wollok project has no test file but a program, then your `.travis.yml` should look like this:

```yml
language: generic

sudo: required

script:
    - git clone https://github.com/uqbar-project/wollok-cli
    - mv wollok-cli/* ./
    - chmod 777 ./runTests.sh
    - ./runPrograms.sh
```

## Testing Wollok CLI: Sanity check

Having https://github.com/wollok/introPepita as a witness case, these are the test cases:

- [x] `pepita.wlk` not compiling => build failed
- [x] missing import `pepita.*` in test file => build failed
- [x] validator errors in `pepita.wlk` like having a constructor in an object definition => build failed
- [x] tests failing with assertion errors => build failed
- [x] test failing with runtime errors (like `division by zero` or `null` parameters in operations like `+`) => build failed
- [x] passing tests => build passed
- [x] warning issues in `pepita.wlk` (but no errors) => build passed

## Updating to a new version of Wollok

Whenever Wollok has a new stable release, you can update all jars from `jars` folder running `generateCI.sh` script. You must provide just one argument, the location of root Wollok development environment folder.

For example, if you have this folder structure:

```bash
  |- wollok-cli
  |   ...
  |- wollok-dev
     |- wollok
        |- wollok development environment files ...
  |-
```

This is the way you should call the script:

```bash
 ./generateCI.sh ../wollok-dev/wollok
```

Don't add the trailing `/` character for wollok root folder. After running the script, you can tests if everything went smooth:

```bash
./sanityCheck.sh
```

## Another useful scripts

They are all in `util` folder:

- **cloneAllProjects.sh**: clones all projects from Wollok organization

## Future steps

- Migrate to Wollok Server Architecture in Amazon?

___

<div style="width: 100%; text-align: center; margin: auto;">
    <image src="./images/uqbarLogo.png" height="3%" width="3%"/> - <i>Powered by Uqbar</i> - http://www.uqbar.org
</div>
