var express = require('express');
var router = express.Router();
const Artwork = require('../models/Artwork');
//update user 
//delete user
//add user
//send friend request

router.post('/',async function(req, res, next) {
    try{ 
        const newArtwork  =await new Artwork({
          username:req.body.username,profilePicture:req.body.image,art:req.body.artworkImage,size:{"height":req.body.height,"width":req.body.width},
          material:req.body.material,details: req.body.details,price:req.body.price
         });
        const  artwork =  await newArtwork.save("FlutterBackend");
        res.status(200).json(artwork);
       }
       catch(error){
        console.log(error);
       }
    
});
router.get('/',(req,res)=>{
  try{
    const oldArtwork = Artwork.findOne({username:"batman"},(err,art)=>{
      if(err){
        res.send(err);
      }
      else{
        res.send(art);
      }
    })
  }catch(error){
    res.send(error);
  }
}
);
module.exports = router;
