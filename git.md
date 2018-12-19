### Git仓库完整迁移 含历史记录

##### 推荐方法
```
git clone --bare https://git.coding.net/dalalao/whsc.git
cd whsc.git
git push --mirror git@glab.yungengxin.net.cn:culture-group/whsc.git

直接一起执行
git clone --bare https://git.coding.net/dalalao/whsc.git && cd whsc.git && git push --mirror git@glab.yungengxin.net.cn:culture-group/whsc.git

https://blog.csdn.net/candyguy242/article/details/45920111
```


##### 笨办法

```
##如我想把linux_datagrand.git这个库里的文件迁移至daguan.git这个新库中，要求如下：
（1）迁移的时候就要考虑到已有的分支；
（2）保留以前的提交记录；
（3）不要把本地的代码直接提交到gitLab，这样以前提交的记录和分支就都没有了。
##操作如下：
git clone git@gitlab.daguancom:19234/linux/linux_datagrand.git
cd linux_datagrand
ls
name.txt   shiyan.txt
##查看当前的远程仓库：
git remote -v
origin  git@gitlab.daguancom:19234/linux/linux_datagrand.git (fetch)
origin  git@gitlab.daguancom:19234/linux/linux_datagrand.git (push)
##添加daguan.git这个远程仓库
git remote add test git@gitlab.daguancom:19234/linux/daguan.git
说明：添加远程仓库的格式：
git remote add  仓库名字   [仓库地址]
##查看当前的远程仓库：
git remote -v
origin  git@gitlab.daguancom:19234/linux/linux_datagrand.git (fetch)
origin  git@gitlab.daguancom:19234/linux/linux_datagrand.git (push)
test    git@gitlab.daguancom:19234/linux/daguan.git (fetch)
test    git@gitlab.daguancom:19234/linux/daguan.git (push)
##把本地的分支push到远程仓库
git push -u test master
这个时候有报错，内容如下：
error: failed to push some refs to 'git@gitlab.daguancom:19234/linux/daguan.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
##解决方法：
（1）由于GitLab一些分支默认被保护，仅仅拥有master级别的用户才能提交到保护分支，而且master分支默认是保护分支，其他用户需要通过合并issue请求来提交上去。所以我们先关闭这个master分支保护： Project: "Settings" -> "Repository" -> “Protected Branches（Expand）”  -> "Unprotect"。
（2）使用命令：git push -f test master
所以把本地的分支push到远程仓库命令：
git push -f test master
##这个时候，我们已经把linux_datagrand.git这个库里的文件迁移至daguan.git这个新库中了。

http://blog.51cto.com/wutengfei/2090253
```
