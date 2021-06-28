# 1. Setup 

### Prerequisites :

   [Docker](https://www.docker.com/products/docker-desktop) to run aio without problems

   [Node](https://nodejs.org/) Lts version:  **Long time support version**

   [Yarn](https://classic.yarnpkg.com/en/docs/install/#mac-stable) LTS version: **Long time support version**

   [FirebaseTools](https://firebase.google.com/docs/cli)

### Change the name directory aio-x example 
   you can simply replace aio-x to your lang using the replacement tool in vscode or webstorm 

```
WebStorm shortcut ⇧⌘F

Vscode shortcut ⌘⇧F

and replace the dir name of aio-x example aio-br , aio-kr
and the aioXDir to your lang example aioBrDir
```
or replace in this files 

```
├── package.json # line 17 aio-x
├── package.json # line 17 aio-x 
├── package.json # line 18 aio-x 
├── package.json # line18 aio-x 
├── sync-origin.js # line 25 aioXDir and aio-x 
```

# 1.1 Cloning the repository
**Using ssh**
```
$ git clone git@github.com:angular-es/AngularCommunities.git
```
-or-

**Using https:**
```
$ git clone https://github.com/angular-es/AngularCommunities.git

```
and

``` 
./update-origin.sh
 ```

#### 1.2 Sync with source repository

This repository uses a submodule to integrate with the source repository.

```
when you run : ./update-origin.sh
you're running these commands  

$ git submodule sync
$ git submodule update --init

```
**this will clone and update the submodule and create the origin folder**

Sometimes if the origin folder exist but is empty breaks thing so please delete the folder

**this will clone and update the submodule and create the origin folder**

#### 1.3 First compilation

If anything sync ok , you need to run 

```
yarn start 
```

this will create a docker image so be patient, only the first time take a lot of time 


**Note**
if you're having any trouble with cache just delete the docker image or use with the no cache flag


```

```

### Deploy 
Work in progress workflows coming soon

# Common errors and how to fixit 

### About 'Hanging Links Found': Add Anchor

When you compile, you may get the following error:

```
warn: Dangling Links Found in "guide/deployment.json":
 -guide/browser-support#polyfills
warn: Dangling Links Found in "guide/deprecations.json":
 -guide/releases#deprecation-practices,
 -guide/component-styles#deprecated-deep - y-ng-deep
warn: Dangling Links Found in "guide/glossary.json":
 -guide/workspace-config # project-tool-configuration-options,
 -guide/workspace-config # project-tool-configuration-options
warn: Dangling Links Found in "api/common/NgForOf.json":
 -guide/template-syntax # template-reference-variables - var-
error: Error: 6 unmatched links
```

This error is a relative link in the documentation warning that the link cannot be found.
In the first example above, although the `guide/implementation` is linked to `guide/browser-support#polyfills`, the `guide/browser-support` page says `#polyfills`. Warning that the holder does not exist.

This error often occurs when you translate a header that begins with `#`.
You must add an anchor in the translation to resolve the link reference. Add a form directive `{@a xxxxxx}` to the translated header as follows.

```md

## Polyfill {@a polyfills}

```


