Minimal Installation on windows 10  more https://github.com/therecipe/qt/wiki/Installation#minimal-installation
```html
  
Install Docker through your package manager or from official site.

Pull docker image for your deployment target. For example if you want to use Linux, you have to run :

docker pull therecipe/qt:linux

docker pull windows_64_shared

Share your GOPATH with docker if needed (for example on macOS).  share the drive of windows in docker setting.

Install this binding by running :

go get -u -v github.com/therecipe/qt/cmd/...



```
