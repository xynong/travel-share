# Cloudflare DNS 修复说明

## 问题原因
你当前的自定义域名 `xynong.ccwu.cc` 已经被解析到 Cloudflare 的 IP（172.67.142.17 / 104.21.54.204），而 GitHub Pages 需要直接指向 GitHub 的 A 记录 IP。Cloudflare 代理会导致 GitHub 的域名验证失败，最终出现 403。

## 你要做的事

### 1. 登录你的域名提供商或 Cloudflare 控制面板
- 找到 `xynong.ccwu.cc` 的 DNS 管理页面

### 2. 修改解析记录
- 类型：A
- 主机名 / 名称：@
- 值：185.199.108.153
- 再添加：185.199.109.153
- 再添加：185.199.110.153
- 再添加：185.199.111.153

### 3. 如果你使用了 Cloudflare
- 这 4 条记录必须设置为 **DNS only（灰云）**
- 不能打开 `Proxied` 或 `orange cloud`

### 4. 如果你已有其他旧记录
- 删除任何指向 `xynong.github.io` 的 CNAME 记录
- 删除当前解析到 Cloudflare 的 `A` 记录

### 5. 在 GitHub Pages 里确认设置
- 打开：`https://github.com/xynong/travel-share/settings/pages`
- Source：`GitHub Actions`
- Custom domain：`xynong.ccwu.cc`
- Save

### 6. 验证
等待 5~15 分钟后访问：
- `https://xynong.github.io/travel-share/`
- `https://xynong.ccwu.cc/`

如果你还想，我可以继续帮你把这几个步骤按“点点点”顺序写成一份更短的操作清单。