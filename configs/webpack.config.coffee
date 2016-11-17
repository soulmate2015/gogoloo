fs = require 'fs'
path = require 'path'


paths = {
    #控制器路径
    controllersPath: path.join __dirname, '../public/controllers'
    #打包路径
    outPath: path.join __dirname, '../public/bin/js'
    #node_module路径
    modulePath: path.join __dirname, '../node_modules'
}


#获取 {}格式的 entry
getObjectEntry = () ->
    files = {}
    #获取文件名集合
    dirList = fs.readdirSync paths.controllersPath
    dirList.forEach (item) ->
        matchFile = item.match /(.+)\.(cjsx|coffee)$/
        if matchFile?
            fileName = matchFile[1]
            files[fileName] = path.resolve paths.controllersPath, fileName
    return files


#获取 []格式的 entry
getArrayEntry = () ->
    files = []
    #获取文件名集合
    dirList = fs.readdirSync paths.controllersPath
    dirList.forEach (item) ->
        matchFile = item.match /(.+)\.(cjsx|coffee|jsx)$/
        if matchFile?
            fileName = matchFile[1]
            files.push path.resolve paths.controllersPath, fileName
    return files


module.exports =

    #入口 可以是{}, 生成多个js; 可以是[], 生成一个打包好的js   vendor 三方库
    entry: {
        main: getArrayEntry()
        vendor: ['lodash']
    }

    #打包后存储地址
    output: {
        path: path.join __dirname, '../public/bin/js'
        filename: '[name].js'
    }

    module: {
        #加载器配置
        loaders: [
            {test: /\.coffee$/, loader: 'coffee'}
            {test: /\.css$/, loaders: ['style', 'css']}
#            {test: /\.cjsx$/, loaders: ['react-hot', 'coffee', 'cjsx']}
            {test: /\.cjsx$/, loaders: ['coffee', 'cjsx']}
        ]
    }

    #其它解决方案配置
    resolve: {
        #查找module的话从这里开始查找
        root: 'node-modules'
        #自动扩展文件后缀名，意味着我们require模块可以省略不写后缀名
        extensions: ['', '.js', '.cjsx', '.coffee']
        #配置别名，在项目中可缩减引用路径
        alias: {
#            'React': 'react'
#            'ReactDOM': paths.modulePath + '/react-dom'
        }

}