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

git 