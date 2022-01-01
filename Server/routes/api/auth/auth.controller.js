const jwt = require('jsonwebtoken')
const User = require('../../../models/user')

/*
    POST /api/auth/register
    {
        phone,
        password
    }
*/

exports.register = (req, res) => {
    const { phone, password } = req.body;
    console.log(req.body);
    let newUser = null

    // create a new user if does not exist
    const create = (user) => {
        if(user) {
            throw new Error('phone exists')
        } else {
            return User.create(phone, password)
        }
    }

    // count the number of the user
    const count = (user) => {
        newUser = user
        return User.count({}).exec()
    }

    // assign admin if count is 1
    const assign = (count) => {
        if(count === 0) {
            return newUser.assignAdmin()
        } else {
            // if not, return a promise that returns false
            return Promise.resolve(false)
        }
    }

    // respond to the client
    const respond = (isAdmin) => {
        res.json({
            message: 'registered successfully',
            admin: isAdmin ? true : false
        })
    }

    // run when there is an error (phone exists)
    const onError = (error) => {
        res.status(409).json({
            message: error.message
        })
    }

    // check phone duplication
    User.findOne({"phone":req.body.phone})
    .then(create)
    .then(count)
    .then(assign)
    .then(respond)
    .catch(onError)
}
//http://localhost:3000/api/user/list?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MTY1NmMxNTRjYzZiODFkZTBkZGFhOTMiLCJwaG9uZSI6Ijk5OTk5OTk5OTUiLCJhZG1pbiI6dHJ1ZSwiaWF0IjoxNjM0MDM5MTcyLCJleHAiOjE2MzQ2NDM5NzIsImlzcyI6InZlbG9wZXJ0LmNvbSIsInN1YiI6InVzZXJJbmZvIn0.LrCstkbi8gWdryCrvwb125DQO1pGbiU51cF98n5Ytdo
/*
    POST /api/auth/login
    {
        phone,
        password
    }
*/

exports.login = (req, res) => {
    const {phone, password} = req.body
    const secret = req.app.get('jwt-secret')

    // check the user info & generate the jwt
    const check = (user) => {
        if(!user) {
            // user does not exist
            throw new Error('login failed')
        } else {
            // user exists, check the password
            if(user.verify(password)) {
                // create a promise that generates jwt asynchronously
                const p = new Promise((resolve, reject) => {
                    jwt.sign(
                        {
                            _id: user._id,
                            phone: user.phone,
                            admin: user.admin
                        }, 
                        secret, 
                        {
                            expiresIn: '7d',
                            issuer: 'velopert.com',
                            subject: 'userInfo'
                        }, (err, token) => {
                            if (err) reject(err)
                            resolve(token) 
                        })
                })
                return p
            } else {
                throw new Error('login failed')
            }
        }
    }

    // respond the token 
    const respond = (token) => {
        res.json({
            message: 'logged in successfully',
            token
        })
    }

    // error occured
    const onError = (error) => {
        res.status(403).json({
            message: error.message
        })
    }

    // find the user
    User.findOne({"phone":req.body.phone})
    .then(check)
    .then(respond)
    .catch(onError)

}

/*
    GET /api/auth/check
*/

exports.check = (req, res) => {
    res.json({
        success: true,
        info: req.decoded
    })
}