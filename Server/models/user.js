const mongoose = require('mongoose')
const Schema = mongoose.Schema
const crypto = require('crypto')
const config = require('../config')

const User = new Schema({
    password:String,
    name: String,
    advisor: String,
    phone: String,
    phone1: String,
    phone2: String,
    email: String,
    agencey: String,
    licBranch: String,
    city: String,
    licOffice:String,
    officer: String,
    profile: String,
    bm: Boolean,
    dm: Boolean,
    cm: Boolean,
    zm: Boolean,
    mdrt: Boolean,
    cot: Boolean,
    tot: Boolean,
    galaxy: Boolean,
    corporate: Boolean,
    other: Boolean,
    isActive: Number,
    expiry:String,
    date:String,
    photo:String,
    admin: { type: Boolean, default: true }
})


// crypto.createHmac('sha1', 'secret')
//              .update('mypasswssord')
//              .digest('base64')


// create new User document
User.statics.create = function(phone, password) {
    const encrypted = crypto.createHmac('sha1', config.secret)
                      .update(password)
                      .digest('base64')

    const user = new this({
        phone,
        password: encrypted
    })

    // return the Promise
    return user.save()
}

// find one user by using phone
User.statics.findOneByphone = function(phone) {
    return this.findOne({
        phone
    }).exec()
}

// verify the password of the User documment
User.methods.verify = function(password) {
    const encrypted = crypto.createHmac('sha1', config.secret)
                      .update(password)
                      .digest('base64')
    console.log(this.password === encrypted)

    return this.password === encrypted
}

User.methods.assignAdmin = function() {
    this.admin = true
    return this.save()
}

module.exports = mongoose.model('User', User)