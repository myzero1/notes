Minimal Installation on windows 10  more https://github.com/therecipe/qt/wiki/Installation#minimal-installation
```html
  
Install Docker through your package manager or from official site.

Pull docker image for your deployment target. For example if you want to use Linux, you have to run :

docker pull therecipe/qt:linux

docker pull windows_64_shared

Share your GOPATH with docker if needed (for example on macOS).  share the drive of windows in docker setting.

Install this binding by running :

go get -u -v github.com/therecipe/qt/cmd/...

如果因为golang.org网站被墙则需要手动如下：

mkdir $GOPATH/src/golang.org/x

cd $GOPATH/src/golang.org/x

git clone https://github.com/golang/crypto.git

git clone https://github.com/golang/tools.git

git clone https://github.com/golang/sys.git

***  replace the 'gp = "//" + strings.ToLower(gp[:1]) + gp[1:]' as 'gp = "/" + strings.ToLower(gp[:1]) + gp[1:]',on line 132,in file cmd.go,under 'pathto\src\github.com\therecipe\qt\internal\cmd', this is import,on window10

再次 go get -u -v github.com/therecipe/qt/cmd/...



```
