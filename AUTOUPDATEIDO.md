# 自动更新README.md中的star数和fork数的说明

### 基于github-action实现

在你需要被关注star fork数的项目中 添加以下action

且需要指定一个服务器来运行相关代码, 在 secrets中指定host以及pass

当发生该仓库star或fork，均会触发action

```yml
# .github/workflows/up.yml
name: up
on:
  watch:
    types: started
  fork:
  workflow_dispatch:

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Print a greeting
        uses: garygrossgarten/github-action-ssh@release
        with:
          host: ${{ secrets.HOST }}
          username: root
          password: ${{ secrets.PASS }}
          command: cd ~/workspace/yaocccc && git pull && bash update.sh
```
