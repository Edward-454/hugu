#!/bin/bash
set +e

# 获取所有可用的 feeds 包
PACKAGES=$(./scripts/feeds list -n)

# 逐个安装包，跳过已知有问题的包
for pkg in $PACKAGES; do
  # 跳过已知有问题的包
  case "$pkg" in
    freeswitch|freeswitch-*|kamailio|kamailio-*|ddns-go|openwrt-bandix)
      echo "跳过有问题的包: $pkg"
      continue
      ;;
  esac
  
  echo "正在安装包: $pkg"
  ./scripts/feeds install "$pkg" 2>/dev/null || echo "安装 $pkg 失败，继续下一个..."
done

# 尝试批量安装剩余包（可能会有一些遗漏的）
echo "尝试批量安装剩余包..."
./scripts/feeds install -a 2>/dev/null || true

set -e
EOF
