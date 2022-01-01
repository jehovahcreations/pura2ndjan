const Youtube = require('../../../models/youtube')
//const Youtube = require('../../../models/youtube')

/* 
    GET /api/user/list
*/

exports.listYoutube = (req, res) => {
    // refuse if not an admin
  Youtube.find({},(err,youtube)=>{
      if(err){
          console.log(err)
      }else{
          console.log(youtube)
      }
  })

}
exports.insertYoutube = (req, res) => {
    //const({name,url,is_Active,image}) = req.body;
console.log(req.body)
    const youtube = new Youtube({
        name:req.body.name,
        url:req.body.url,
        is_Active:1,
        image:req.body.image
    })
    youtube.save();
    console.log(youtube._id);



}



// /*
//     POST /api/user/assign-admin/:username
// */
// exports.assignAdmin = (req, res) => {
//     // refuse if not an admin
//     if(!req.decoded.admin) {
//         return res.status(403).json({
//             message: 'you are not an admin'
//         })
//     }

//     User.findOneByUsername(req.params.username)
//     .then(
//         user => {
//             if(!user) throw new Error('user not found')
//             user.assignAdmin()
//         }
//     ).then(
//         res.json({
//             success: true
//         })
//     ).catch(
//         (err) => { res.status(404).json({message: err.message})}
//     )
// }