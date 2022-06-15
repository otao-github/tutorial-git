# Git教程

# 优点，分布式，瞬间切换分支，免费

<工作区根目录>: git init # 创建隐藏文件夹 .git 用于吧版本管理

git add readme.txt # 加入文件
git rm readme.txt # 删除文件
git commit -m "注释" # 提交变动

git status # 检查仓库状态
git checkout -- readme.txt # 放弃变动
git diff # 查看变动细节

git log # 查看历史commit
git log --pretty=online
git reset --hard HEAD~1 # 回退到上个版本 (HEAD~2 上上个版本) (HEAD~100 上100个版本)
git reset --hard commit_id # 回退到指定版本 id.length >= 4
git reflog # 查看HEAD指针切换记录

git diff HEAD -- readme.txt # 查看工作区与当前分支的文件变动



# 工作区 --(add)--> stage 暂存区 --(commit)--> branch:master 当前分支 --()--> 远程仓库 repository

# 回退
# 工作区变动
git checkout -- readme.txt # 丢弃工作区文件更改
# 暂存区变动
git reset HEAD readme.txt # to unstage file changes
git restore --staged readme.txt # to unstage file changes

# 远程仓库篇
git-bash: ssh-keygen -t rsa -C "youremail@example.com" # 一路回车 创建密钥对 %USERPROFILE%/.ssh
# id_rsa（私钥，保密）
# id_rsa.pub（公钥，上传 Github / Account settings / SSH Keys）

# Github 创建仓库
git remote add origin git@github.com:michaelliao/learngit.git # 关联远程代码仓库
# 这里远程库的名字是 origin
git push -u origin master # 推送本地master分支所有内容至远程仓库，-u参数，会把本地的master分支和远程的master分支关联起来，简化以后操作
git push origin master # 推送本地最新更新至远程

git remote -v # 查看已绑定远程库
git remote rm <name> # 解绑远程代码仓库

# 载入远程库
git clone git@github.com:michaelliao/gitskills.git
# ssh 速度更快，https 协议速度较慢

# 分支篇
# 默认master指针指向当前分支, HEAD指向master
# 新建分支dev指向master分支, HEAD指向dev
# 更新dev分支
# 合并分支master指向dev分支
# 删除dev指针

git branch dev # 创建分支
# git checkout dev # DEPRECATED 切换分支dev
# git checkout -b dev # DEPRECATED 简化命令 创建并切换分支dev HEAD = &dev
git switch dev # 切换分支
git switch -c dev # 创建并切换分支

git branch # 查看分支
git switch master # HEAD = &master
git merge dev # 合并dev到当前分支（master） master = &dev
git branch -d dev # 删除dev指针

# 分支融合
    # 快速合并/快进融合，master无新提交，dev下有新提交
    # 冲突，master/dev各自有新的提交
        git status # 查看冲突
        git add readme.txt # 解决冲突
        git status # 查看
        git commit -m 'conflict fixed'
        git log --graph --pretty=oneline --abbrev-commit # 查看分支合并情况
        git branch -d feature1 # 删除分支

git log -graph # 查看分支合并图
# 按q 退出 more 模式

# Github 篇
# new reposity
git@github.com:otao-github/tutorial-git.git
# …or create a new repository on the command line
echo "# tutorial-git" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:otao-github/tutorial-git.git
git push -u origin main
# …or push an existing repository from the command line
git remote add origin git@github.com:otao-github/tutorial-git.git
git branch -M main
git push -u origin main

# --no-ff 关闭fastforward 通过增加一次commit 避免删除分支丢失分支信息
git merge --no-ff -m "merge with no-ff" dev

# stash 临时缓存工作区
# 适用于临时切换 branch
git stash # 将未提交工作区状态暂存
git stash list # 查看暂存栈
    git stash apply stash${0} # 回复暂存状态
    git stash drop # 删除暂存状态
git stash pop # 回复最近一次暂存工作区并从暂存列表中删除

git cherry-pick 4c805e2 # 不合并分支，只合并最后指定一次提交 commit_id
git branch -D feature-vulcan # 强制删除未合并分支

# 多人协作篇
git clone git@github.com:michaelliao/learngit.git

git branch
# * master
# 只克隆了origin/master分支

# 切换到远程origin/dev分支 作为本地dev分支
git checkout -b dev origin/dev

# [文件变动]
git add -A
git commit -m "file update"
git push origin dev # 推送本地dev到远程仓库 origin/dev分支
# 同等与 git push origin dev:dev

# 拉取新版本远程分支
git pull
# no tracking information
# git pull 失败，原因是没有指定本地dev分支与远程origin/dev分支的链接

# 设置dev和origin/dev的链接
git branch --set-upstream-to=origin/dev dev

git pull
# Auto-merging env.txt
# CONFLICT (add/add): Merge conflict in env.txt
# Automatic merge failed; fix conflicts and then commit the result.
# 拉去后提示合并冲突，手动解决冲突
git commit -m "fix env conflict"

# 当其他人对该文件的变动已存在 提交产生冲突
git pull origin dev # 抓取已更新远程分支

# 在本地解决冲突 再合并
git add conflict.txt
git commit -m 'fix conflict'
git push origin dev


# 当查看提交线觉得很乱时候
git log --graph --pretty=oneline --abbrev-commit

# 变基分支 rebase
git rebase
# 将当前分叉设为根基 使log结果成为一条直线

git commit -m "rebase"

