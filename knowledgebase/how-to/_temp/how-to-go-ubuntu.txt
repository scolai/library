what: query for multiple records in a database rather a single record
why/when: when a user logs into their account we may want to show their entire order history, not just the most recent order
how:
where:


VSCODE
*for WSL - install on Windows from .exe and access via ubuntu code


UBUNTU
(list all installed programs)
> apt list --installed

(uninstall program)
> sudo apt purge <package>


GO
(easy install)
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install golang-go
$ go version

(binary installation) https://sal.as/post/install-golan-on-wsl/
(You may need to run the command as root or through sudo).
Do not untar the archive into an existing /usr/local/go tree. This is known to produce broken Go installations.
$ rm -rf /usr/local/go
wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
$ sudo tar -xvf go1.11.5.linux-amd64.tar.gz
sudo mv go /usr/local
sudo nano ~/.bashrc
-scroll down and add
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
-update
source ~/.bashrc
$ go version

****************************************************
****************************************************

GO WORKSPACES https://go.dev/doc/tutorial/workspaces
(create workspace)
> mkdir workspace
> cd workspace
> go work init ./hello ('hello' is file name containing module/package)

(run program from workspace directory)
> go run ./hello

(add/update a module)
*from workspace directory:
> git clone https://mysource.com/example
*add module from clone into workspace
> go work use ./example/hello (where 'hello' contains the module)

(run modules from workspace directory)
> go run ./hello

****************************************************
****************************************************

(install chi router)
> go get -u github.com/go-chi/chi/v5

GO MODULES https://go.dev/blog/using-go-modules
(create new module, in project root folder)
('example' is project root, 'hello' is package turned into module via 'go mod init')
> go mod init example.com

(install module)
> go install . (enables project to be run by entering into terminal 'example')


(discover required/add dependencies)
> go build
> go test
*if dependencies errors, may not update automatically
> go mod tidy

(print current module's dependencies)
> go list -m all

(view cryptographic hashes of specific module versions, also useful for finding untagged versions for updating)
> cat go.sum

(changes required version of a dependency, or adds new dependency)
> go get
* get a specific version of dependency using @
> go get example/example@1.3.1

(upgrade a dependency in package file to a new version)
> go doc example/example/1.3.1

(remove unused dependencies)
> go mod tidy

(

GOPATH
(initial setup of go project into gopath)
export GOPATH=$HOME/myProjectFolder

(system-wide installation)
export PATH=$PATH:/usr/local/go/bin

(compile and run)
./myFile

(optional: download any files into path)
go get <url location of files etc>
(run without compiling)
$GOPATH/bin/<filename> 

***

DOCKER
(want a clean slate)
recreate docker containers
docker compose down
docker compose up -d

PSQL-DOCKER
(connect to psql via docker)
-find correct container name-
> docker ps
-connect to psql
docker exec -it <CONTAINER NAME> /usr/bin/psql -U <USER NAME> -d lenslocked
> docker exec -it lenslocked-db-1 /usr/bin/psql -U baloo -d lenslocked




UBUNTU
(download files)
wget [url]
(download folder)
wget -r [url]

(download project folders/files to local drive
* from github - <download to local folder>


(unzip zip folders)
> unzip file.zip -d <destination folder>


MOVE FOLDERS ETC IN LINUX https://www.cyberciti.biz/faq/mv-command-howto-move-folder-in-linux-terminal/

(move folder etc)
> mv <folder> <folder> <folder destination>


(simultaneously create and move folder to newly created folder)
> mkdir <newfolder> && mv <folder> <newfolder>


(move all contents at once using *)
> mv * <destination>



******************************************************************************
******************************************************************************


TAILWIND
(Setting up Tailwind CSS in a Vite project. Setting up Tailwind CSS in a Vite project)
https://tailwindcss.com/docs/guides/vite

-Create your project, using Vite
> npm create vite@latest <project name> -- --template react
> cd <project name>

-install tailwind
> npm install -D tailwindcss postcss autoprefixer
> npx tailwindcss init -p

-Configure your template paths
> code tailwind.config.js
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}

-Add the Tailwind directives to your ./src/index.css file
@tailwind base;
@tailwind components;
@tailwind utilities;

-Start your build process
npm run dev

-Start using Tailwind in your project !
(App.jsx):
export default function App() {
  return (
    <h1 className="text-3xl font-bold underline">
      Hello world!
    </h1>
  )
}



*****************************************************************************
*****************************************************************************

GOHTML
(add gohtml to emmet preferences in vscode user settings.json)
"emmet.includeLanguages": {
        "GoHTML": "html"
    },


** END **

(copy file from windows folder to wsl2)
> cp /mnt/c/Users/slain/Documents/_libraries/libr_ps/w
eb/icons/entypo/Entypo+/Entypo+/check.svg img


** END **


*****************************************************************************
*****************************************************************************

HTML

(file paths)

<img src="picture.jpg">	The "picture.jpg" file is located in the same folder as the current page
<img src="images/picture.jpg">	file is located in the images folder in the current folder
<img src="/images/picture.jpg">	file is located in the images folder at the root of the current web
<img src="../picture.jpg">	file is located in the folder one level up from the current folder