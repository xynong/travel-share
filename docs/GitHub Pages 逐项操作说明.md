# GitHub Pages 逐项操作说明

仓库地址：https://github.com/xynong/travel-share

## 1. 进入设置页
1. 打开 GitHub 仓库页面
2. 点击右上角的 Settings
3. 左侧菜单里找到 Pages

如果你看不到 Pages，说明当前仓库权限或 GitHub 账户设置不够，先确认你是这个仓库的管理员。

## 2. 在 Pages 里选择部署方式
在 Pages 页面里看到下面这些选项时：
- Source：选择 GitHub Actions

然后点击 Save。

## 3. 填写自定义域名
在 Pages 页面里找到 Custom domain 这一栏：
- 输入：xynong.ccwu.cc
- 点击 Save

## 4. 等待 GitHub 部署
保存后，GitHub 会开始部署。
通常需要 1～5 分钟，部分时间更久。

## 5. 配置域名解析
如果你有域名，请去域名服务商后台设置：
- 添加 A 记录
- 主机名填：@
- 值填：185.199.108.153、185.199.109.153、185.199.110.153、185.199.111.153

如果你使用 Cloudflare，请设置这些记录为“DNS only（灰云）”，不要启用代理。

## 6. 访问站点
部署完成后，访问下面两个地址：
- 默认地址：https://xynong.github.io/travel-share/
- 自定义域名：https://xynong.ccwu.cc

## 7. 如果你想一步到位
直接按这个顺序点：
- Settings → Pages → Deploy from a branch → main → /root → Save → Custom domain 填 xynong.ccwu.cc → Save
