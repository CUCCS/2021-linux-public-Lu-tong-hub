#!/usr/bin/env bash

# help文档
function help {
    echo "-q Q               对jpeg格式图片进行图片质量因子为Q的压缩"
    echo "-r R               对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩成R分辨率"
    echo "-w font_size text  对图片批量添加自定义文本水印"
    echo "-p text            统一添加文件名前缀，不影响原始文件扩展名"
    echo "-s text            统一添加文件名后缀，不影响原始文件扩展名"
    echo "-t                 将png/svg图片统一转换为jpg格式图片"
    echo "-h                 帮助文档"
}

# 用*遍历文件夹中的所有文件
# 对jpeg格式图片进行图片质量为Q的压缩
function qualitycompress {
    Q=$1 # 质量因子
    for i in *;do
        type=${i##*.} # 删除最后一个.及左边全部字符,获得文件类型
        if [[ ${type} == "jpg" || ${type} == "jpeg" || ${type} == "JPEG" ]];then 
            convert "${i}" -quality "${Q}" "${i}"
            echo "Compressing ${i} complete!"
        fi
    done
}

# 对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩成R分辨率
function Compressed_Resolution {
    R=$1
    for i in *;do
        type=${i##*.}
        if [[ ${type} == "jpg" || ${type} == "png" || ${type} != "svg" || ${type} == "jpeg" || ${type} == "JPEG" ]]; then
            convert "${i}" -resize "${R}" "${i}"
            echo "Compressing resolution ${i} complete!"
        fi
    done
}

# 对图片批量添加自定义文本水印
function watermarking {
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "jpg" && ${type} != "png" && ${type} != "svg" && ${type} != "jpeg" && ${type} != "JPEG" ]]; then continue; fi;
        convert "${i}" -pointsize "$1" -fill blue -gravity center -draw "text 10,15 '$2'" "${i}"
        echo "Watermarking ${i} with $2 complete!"
    done
}

#  统一添加文件名前缀，不影响原始文件扩展名
function addprefix {
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "jpg" && ${type} != "png" && ${type} != "svg" && ${type} != "jpeg" && ${type} != "JPEG" ]]; then continue; fi;
        mv "${i}" "$1""${i}"
        echo "Renaming ${i} to $1${i} complete!"
    done
}
#  统一添加文件名后缀，不影响原始文件扩展名
function addsuffix {
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "jpg" && ${type} != "png" && ${type} != "svg" && ${type} != "jpeg" && ${type} != "JPEG" ]]; then continue; fi;
        newname=${i%.*}$1"."${type}
        mv "${i}" "${newname}"
        echo "Renaming ${i} to ${newname} complete!"
    done
}

# 将png/svg图片统一转换为jpg格式图片
function transformto_jpg {
    for i in *;do
        type=${i##*.}
        if [[ ${type} == "png" || ${type} == "svg" ]]; then
            newname=${i%.*}".jpg"
            convert "${i}" "${newname}"
   	        echo "Transforming ${i} to ${newname} complete!"
        fi
    done
}

# 判断是什么操作，不同情况用不同的函数
while [ "$1" != "" ];do
  case "$1" in
    "-q")
        qualitycompress "$2"
        exit 0
        ;;
    "-r")
        Compressed_Resolution "$2"
        exit 0
        ;;
    "-w")
        watermarking "$2" "$3"
        exit 0
        ;;
    "-p")
        addprefix "$2"
        exit 0
        ;;
    "-s")
        addsuffix "$2"
        exit 0
        ;;
    "-t")
        transformto_jpg
        exit 0
        ;;
    "-h")
        help
        exit 0
        ;;
  esac
done