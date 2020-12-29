# 1. Setup 

### Prerequisites :

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
├── build-win.ps1 # line42 aio-x 
├── build-win.ps1 # line 53 aio-x 
├── build.sh # line10 aio-x 
├── build.sh # line 21 aio-x 
├── sync-origin.js # line 31 aio-x 
├── sync-origin.js # line 49 aioXDi
├── sync-origin.js # line 53 aioXDir
```

# 1.1 Cloning the repository
**Using ssh**
```
$ git clone git@github.com:angular-es/AngularComunities.git
```
-or-

**Using https:**
```
$ git clone https://github.com/angular-es/AngularComunities.git

```
and

``` 
yarn install
 ```

#### 1.2 Sync with souce repository

This repository uses a submodule to integrate with the source repository.

```
$ git submodule sync
$ git submodule update --init
```
if this doesnt work and you doesnt have a origin folder in your directory run:

```
./update-origin.sh
```
**this will clone and update the submodule and create the origin folder**

#### 1.3 First compilation

When the compilation is complete, the documentation site will be displayed in the `.tmp/aio/dist` directory.
You can check the created site by setting up a development server with your favorite tool.

```
$ ./build.sh

```
#### 1.3.x 
If you use windows use this command in powershell it can be executed from windows server 2008 > , it has been tested on windows 8 and 10.

```
$./build-win.ps1 or .\build.sh
```

**Note**
-If you have problems with windows, check if your system is compatible with robocopy & Get-Content.
-The construction time is very long, so please wait while you make coffee.
-On macOS, the operating system file descriptor can be used during the build process.
In that case, you need to increase the maximum number check this:
https://github.com/meteor/meteor/issues/8057#issuecomment-261011063

```
$ echo kern.maxfiles = 65536 | sudo tee -a /etc/sysctl.conf
$ echo kern.maxfilesperproc = 65536 | sudo tee -a /etc/sysctl.conf
$ sudo sysctl -w kern.maxfiles = 65536
$ sudo sysctl -w kern.maxfilesperproc = 65536
$ ulimit -n 65536

```

#### Working with differential builds

After doing a local compilation once, you can rewrite the file directly to the `.tmp/aio` directory and work seamlessly with a differential compilation.
As long as the `yarn serve-and-sync` command is running, it can automatically rebuild when there are changes to the files in` .tmp/aio`.
However, the work in the `.tmp` directory is not managed by Git, so be sure to reflect it in the` aio-x` directory after the job.

```
$ cd .tmp/aio
$ yarn serve-and-sync starts the sever on localhost:4200 

```

### Deploy 
Go to the .tmp/aio/dist folder and drop the content in your hosting or use the dir to deploy to firebase 
or just only use the firebase deploy 
using 
```
firebase init 
```

attach your project and deploy
⚠️ don't overwrite the firebase.json file you can experiment issues with broken links in firebase

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


