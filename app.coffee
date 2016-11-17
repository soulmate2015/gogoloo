express = require 'express'
path = require 'path'
favicon = require 'serve-favicon'
logger = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'

routes = require './service/routes/index.coffee'

app = express()

#视图模版配置
app.set 'views', path.join(__dirname, 'public/views')
app.set 'view engine', 'jade'

#uncomment after placing your favicon in /public
app.use favicon(path.join(__dirname, 'public', '/assets/img/favicon.ico'))
app.use logger('dev')
app.use bodyParser.json()
app.use bodyParser.urlencoded({ extended: false })
app.use cookieParser()

#静态文件配置
app.use express.static(path.join(__dirname, 'public'))

#路由
app.use '/', routes

#404错误捕获
app.use (req, res, next) ->
    err = new Error 'Not Found'
    err.status = 404
    next err

#error handlers

#development error handler
#will print stacktrace
if app.get('env') is 'development'
    app.use (err, req, res, next) ->
        res.status err.status || 500
        res.render 'error', {
            message: err.message,
            error: err
        }

#production error handler
#no stacktraces leaked to user
app.use (err, req, res, next) ->
    res.status err.status || 500
    res.render 'error', {
        message: err.message,
        error: {}
    }


module.exports = app