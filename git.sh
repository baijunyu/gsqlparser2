# 你的个人访问令牌
PAT="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"

# 检查是否有未提交的更改
if [ -n "$(git status --porcelain)" ]; then
  echo "There are uncommitted changes. Stashing..."
  # 暂存更改
  git stash save "Uncommitted changes before switching branches"
fi

#git remote add -f gsp_demo_java111 https://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@github.com/baijunyu/gsplparser.git

git clone -b main https://github.com/baijunyu/gsplparser.git

echo 'success'

git subtree add --prefix=gsp_demo_java gsp_demo_java gsp_demo_java_branch
# 创建并切换到新分支
git checkout -b gsp_demo_java_branch

# 恢复暂存的更改（如果之前有暂存）
if [ -n "$(git stash list)" ]; then
  echo "Restoring stashed changes..."
  git stash apply
fi

# 提交更改（如果需要）
if [ -n "$(git status --porcelain)" ]; then
  git add .
  git commit -m "Initial commit for gsp_demo_java_branch"
fi

# 推送新分支到远程仓库
git push -u gsp_demo_java gsp_demo_java_branch
