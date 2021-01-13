# 配置数据库

- 参考阅读：<https://xsliulab.github.io/Workshop/week21/SQL%E5%9F%BA%E7%A1%80.html>

## 安装 MYSQL

```sh
brew install mysql
# 启动后台 mysql 服务
brew services start mysql
# 仅运行使用：
# mysql.server start
```

## 配置 MYSQL

无 root 连接：

```sh
mysql -uroot
# mysql -u root -p
```

1. 创建数据库

```mysql
create database if not exist blog_service;
use blog_service;
```

2. 创建标签表

```mysql
create table `blog_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '标签名称',
  `state` tinyint(3) unsigned DEFAULT '1' COMMENT '状态 0 为禁用、1 为启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签管理';
```

3. 创建文章表

```mysql
create table `blog_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  
)
```