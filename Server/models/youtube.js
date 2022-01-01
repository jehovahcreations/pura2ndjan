const mongoose = require('mongoose')
const Schema = mongoose.Schema
const crypto = require('crypto')
const config = require('../config')

const Youtube = new Schema({
    name:String,
    url:String,
    is_Active: Number,
    image: String,
    date:{
        type:Date,
        default:Date.now()}
})




module.exports = mongoose.model('Youtube', Youtube)