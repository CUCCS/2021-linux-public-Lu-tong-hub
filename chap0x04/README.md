# Linux第四章实验报告

## 软件环境：Virtualbox、Ubuntu 20.04 Server 64bit、宿主机Windows10系统、Visual Studio Code

### 任务一：用bash编写一个图片批处理脚本，实现以下功能：
- [x] 支持命令行参数方式使用不同功能
- [x] 支持对指定目录下所有支持格式的图片文件进行批处理
- [x] 支持以下常见图片批处理功能的单独使用或组合使用
  - [x] 支持对jpeg格式图片进行图片质量压缩
  - [x] 支持对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率(没有完全完成，svg的图片没有成功)
  - [x] 支持对图片批量添加自定义文本水印
  - [x] 支持批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名）
  - [x] 支持将png/svg图片统一转换为jpg格式图片

### 任务二：用bash编写一个文本批处理脚本，对以下附件分别进行批量处理完成相应的数据统计任务：
* 2014世界杯运动员数据
    - [x] 统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数 量、百分比
    - [x] 统计不同场上位置的球员数量、百分比
    - [x] 名字最长的球员是谁？名字最短的球员是谁？
    - [x] 年龄最大的球员是谁？年龄最小的球员是谁？

### 任务三：用bash编写一个文本批处理脚本，对以下附件分别进行批量处理完成相应的数据统计任务：
* Web服务器访问日志
    - [x] 统计访问来源主机TOP 100和分别对应出现的总次数
    - [x] 统计访问来源主机TOP 100 IP和分别对应出现的总次数
    - [x] 统计最频繁被访问的URL TOP 100
    - [x] 统计不同响应状态码的出现次数和对应百分比
    - [x] 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
    - [x] 给定URL输出TOP 100访问来源主机

### 实验步骤

* 用vscode remote远程连接虚拟机(相较在git bash中操作更加方便,可以直接将文件拖入到指定位置)
* 编写代码，并在终端运行观察结果

#### 任务一
* 首先在虚拟机中安装imagemagick
  >sudo apt-get update && sudo apt-get install imagemagick
* 编写代码
* 执行测试(将图片放入代码所在的文件夹)

#### 任务二
* 将所需文件下载到本地，并放入要执行的文件夹
* 编写代码
* 执行测试

#### 任务三
* 将所需文件下载到本地并解压，或者可以在虚拟机中安装p7zip-full，执行下列语句解压到代码所在文件夹
> sudo apt-get install p7zip-full
> 7z x web_log.tsv.7z
* 编写代码
* 执行测试

### 实验中遇到的问题
* 在用vscode remote远程连接虚拟机时，一直报错:没有连接远程商店，看到语雀同学上有相似的问题，更改了同步时间，也没有成功，最后经有相同问题的同学的分享，在Remote - SSH的扩展设置-->Remote.SSH:Path处填写ssh.exe的完整路径，终于成功，但是不知道这是什么原理
  
* 在执行任务一的svg图片压缩分辨率时，没有成功，会生成以下报错：
Compressing resolution 2.png complete!
Compressing resolution 3.jpg complete!
convert-im6.q16: no decode delegate for this image format `SH' @ error/constitute.c/ReadImage/560.
convert-im6.q16: no images defined `program1.sh' @ error/convert.c/ConvertImageCommand/3258.
Compressing resolution program1.sh complete!

### 参考资料
* 师哥/师姐的实验报告  <https://github.com/CUCCS/linux-2020-LyuLumos/tree/ch0x04>
* [Linux中的awk命令详解](https://blog.csdn.net/jin970505/article/details/79056457?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522161923428216780366546108%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=161923428216780366546108&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~sobaiduend~default-1-79056457.pc_search_result_no_baidu_js&utm_term=linux+awk%E5%91%BD%E4%BB%A4%E8%AF%A6%E8%A7%A3)

