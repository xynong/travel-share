# 行游时光 · Travel Share

这是一个面向旅行分享、文化体验与环保出行主题的静态网站，采用现代时尚与民族风格设计，适合直接部署到 GitHub Pages。

## 站点内容
- 首页：品牌介绍、路线推荐、旅程清单和旅人故事
- 子页面：关于我们、目的地、旅人故事、联系我们
- 404 页面：为 GitHub Pages 的页面缺失场景准备

## 本地预览
在项目根目录运行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "& { Set-Location 'c:\Users\xieyong\GitHub\travel-share'; . .\serve.ps1 }"
```

然后访问：

- http://127.0.0.1:8080/

## GitHub Pages 发布
将仓库推送到 GitHub 后，在仓库设置中开启 Pages，并选择以下来源：

- Source: GitHub Actions

然后在域名解析中添加 4 条 A 记录：
- 185.199.108.153
- 185.199.109.153
- 185.199.110.153
- 185.199.111.153

如果你使用 Cloudflare，请保证这些记录是“DNS only（灰云）”，不要启用代理（orange cloud）。

