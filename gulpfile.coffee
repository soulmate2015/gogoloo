gulp = require 'gulp'
webpack = require 'webpack'
del = require 'del'
sequence = require 'run-sequence'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'
uglifycss = require 'gulp-uglifycss'
nodemon = require 'gulp-nodemon'

webpackConfig = require './configs/webpack.config.coffee'

#定义项目相关路径
paths = {
    #打包用的目录
    app: 'app/'
    #第三方库
    lib: ['lib/**/*']
    #编译后的发布代码
    dist: ['dist/**/*']
    #静态文件(主要为图片)
    assets: ['assets/**/*']
    #视图文件(HTML)
    views: ['./*.html']
    #less源码
    lessSrc: ['src/less/**/**.less']
    #coffee源码
    coffeeSrc: ['controllers/**/**.coffee']
}



#目录清理
gulp.task 'clean', (callback) ->
    console.log 'task :1  ->  目录清理'
    del ['public/bin'], callback


#webpack
gulp.task 'webpack', (callback) ->
    console.log 'task :2  ->  webpack'
    webpack webpackConfig, (err, status) ->
        if err?
            console.log "Webpack error -> #{err}"
        gutil.log "[webpack:build]", status.toString(colors: true)
        callback()

#
gulp.task 'stylesheets', (callback) ->
    console.log 'task :3  ->  stylesheets'
    



#开发环境 启动服务,监听端口
gulp.task 'server', () ->
    console.log 'task :4  ->  监听端口'
    stream = nodemon {
        script: './bin/www.coffee'
    }
    stream.on 'restart', () ->
        console.log 'restart'
    stream.on 'crash', () ->
        console.error 'Application has crashed!\n'
        stream.emit 'restart', 30


#gulp默认任务
gulp.task 'default', () ->
    console.log '----- Gogoloo init -----'
    sequence(
        'clean'
        'webpack'
        'server'
    )
