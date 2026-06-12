# **建立一个自己的brew tap：**
```bash
github.com/JianLin-Li/homebrew-tools
```

## 然后维护：
```bash
homebrew-tools
├── Formula
│     ├── mysqld_exporter.rb
│     ├── alertmanager.rb
│     ├── blackbox_exporter.rb
│     ├── redis_exporter.rb
│     └── kafka_exporter.rb
```

## 以后只需：
```bash
brew tap JianLin-Li/tools
brew install alertmanager
brew install mysqld_exporter
brew install redis_exporter
brew services start alertmanager
```

## 使用体验会和官方 Homebrew 包完全一致，而且比较适合长期维护一套本地rb文件
