const router = require('express').Router()
const controller = require('./user.controller')
const youtube = require('./youtube.controller')

router.get('/listYoutube', youtube.listYoutube)
router.get('/list', controller.list)
router.post('/assign-admin/:phone', controller.assignAdmin)
router.post('/insertYoutube', youtube.insertYoutube)

module.exports = router