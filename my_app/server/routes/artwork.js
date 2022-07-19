var express = require('express');
var router = express.Router();
const Artwork = require('../models/Artwork');
//update artwork 
//delete artwork
//add artwork
router.patch('/',)

router.post('/',async function(req, res, next) {
    try{ 
        const newArtwork  = new Artwork({
          username:req.body.username,profilePicture:req.body.image,art:req.body.artworkImage,size:{"height":req.body.height,"width":req.body.width},
          material:req.body.material,details: req.body.details,price:req.body.price,description:req.body.description
         });
        const  artwork =  await newArtwork.save("FlutterBackend");
        
        res.status(200).json(artwork);
       }
       catch(error){
        console.log(error);
       }
    
});
router.get('/',async (req,res)=>{
  try{ 
    const t = await Artwork.findById("62b45141ac05283a05a0b0a8");
    console.log(t);
    const oldArtwork = Artwork.findOne({username:"prajwalkalpande3"},(err,art)=>{
      if(err){
        res.send(err);
      }
      else{
        res.status(200).json(art);
      }
    })
  }catch(error){
    res.send(error);
  }
}
);
module.exports = router;
