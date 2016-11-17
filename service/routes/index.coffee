path = require 'path'
express = require 'express'
router = express.Router()

###
    GET home page.
###



#router.get '*', (req, res) ->
#    res.sendFile path.join(__dirname, '../../public/views', 'index')


#router.get '/', (req, res, next) ->
#    res.render 'index', { title: 'Gogoloo' }


router.get '*', (req, res, next) ->
    res.render 'index', { title: 'Gogoloo' }



module.exports = router