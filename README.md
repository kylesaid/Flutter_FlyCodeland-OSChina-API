# Flutter_OSChina_practice

#### Description

Start Time：2023.12.18；

Completed Time：———

I'm a iOS Developer. Because of the situation of finding job with iOS developer, I decide to pick up the Flutter to make a real development.

So this is the beginning to learning multi-platform techology, I want to make some progress in some areas to defending the time has elapsing every second.

Hope it will be finished very soon.

OSChina reference link： https://github.com/yubo725/flutter-osc



#### 缘起

想完整实现一个Flutter的应用，找了很多开源项目资源：

- 玩Android [https://github.com/phoenixsky/fun\_android\_flutter](https://github.com/phoenixsky/fun_android_flutter)

- 豆瓣 [https://github.com/kaina404/FlutterDouBan](https://github.com/kaina404/FlutterDouBan)

- 抖音 [github.com/mjl0602/flutter_tiktok](http://github.com/mjl0602/flutter_tiktok)

- 开源中国 [https://github.com/yubo725/flutter-osc](https://github.com/yubo725/flutter-osc)

- 斗鱼 [github.com/yukilzw/dy_flutter](http://github.com/yukilzw/dy_flutter)

- [2023年十大最受欢迎的Flutter开源应用程序](https://juejin.cn/post/7245170503798538296)

- [请收下我的 20 个 Flutter 开源项目](https://www.jianshu.com/p/72e359bfe1e0)

- [7个Flutter开源项目让你成为更好的Flutter开发者](https://juejin.cn/post/7219234932735934524) 

- [20个Flutter最漂亮的UI库和项目](https://blog.csdn.net/kongTy/article/details/120218937)

- [推荐10个Flutter开源项目](https://segmentfault.com/a/1190000044000610)

很多的旧项目，虽然隔了两年，但是跑起来，需要的，一是null-safety的改动，需升级依赖库等；二是需要参考文档进行 Android embedding v2的工作，包括里面很多的报错和修改，尝试了两日，放弃了；

本身豆瓣是个很好的练手主题，但是关闭了api，去找资源无果，倘若通过抓包提取出接口调取方式和参数来汇成文档，会花些功夫，且我的本意是练手Flutter，于是左挑右选，还是回归了OSChina；

#### 起步
**创建仓库**

选择在gitee上创建[远程仓库](https://gitee.com/kenjideve/flutterbyoschina "远程仓库")；


**文件结构参考**

[【Flutter 从 0 到 1】Flutter 简单的工程化](https://juejin.cn/post/7043739073529249805 "Flutter 从 0 到 1】Flutter 简单的工程化") - 合理的目录规划

**Api文档**

https://www.oschina.net/openapi

**获取资源文件**

1. 通过下载apk或是ipa文件改为zip解压获取需要资源文件；
  https://www.oschina.net/app/ ，点击Get It On Google Play下载最新的apk文件；
2. 通过apktools反编译出图片资源；
- 安装apktool，https://apktool.org/docs/install 页面有各种安装方式，我是mac环境，选择了使用homebrew命令安装，在`terminal`输入：
```
brew install apktool
```
- apktool 运行环境 JDK > 8 ，需要预先安装；
- 安装好apktool，cd到apk所在目录，执行命令：
```
apktool d osc-android-v5.0.3-release.apk
```
```
mindor@192 Downloads % apktool d osc-android-v5.0.3-release.apk
I: Using Apktool 2.9.1 on osc-android-v5.0.3-release.apk
I: Loading resource table...
I: Decoding file-resources...
I: Loading resource table from file: /Users/mindor/Library/apktool/framework/1.apk
I: Decoding values */* XMLs...
I: Decoding AndroidManifest.xml with resources...
I: Regular manifest package...
I: Baksmaling classes.dex...
I: Baksmaling classes2.dex...
I: Copying assets and libs...
I: Copying unknown files...
I: Copying original files...
I: Copying META-INF/services directory
```
3. 执行完后可以在当前文件夹中获取到编译出来的图片资源；
  ![获取到的资源地址](https://oscimg.oschina.net/oscnet/up-e95431f3df226017c6136642497af578941.png "获取到的资源地址")

**开始搭建Tabbar** - 2023.12.20

进入main.dart，开始构建app的各个基本page，并在此基础上对每个模块进行完善；

-- 未完待续