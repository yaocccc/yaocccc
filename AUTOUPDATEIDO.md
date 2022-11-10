# 如何利用github action 实现 发生 star、fork等事件时自动更新本仓库

请将以下文件放入需要关注的仓库的 .github/workflow 中，请修改相应参数

PS：需要自己设置 GT(github_token) 到被关注仓库的 secrets 中 (从你的github帐号设置中创建github_token)

```plaintext
# .github/workflow/call.yml
name: call
on:
  watch:
    types: started
  fork:

jobs:
  call:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Call
        run: |
          curl -X POST https://api.github.com/repos/yaocccc/yaocccc/dispatches \
              -H "Accept: application/vnd.github.everest-preview+json" \
              -H "Authorization: token ${{ secrets.GT }}" \
              --data '{"event_type": "up"}'
```
