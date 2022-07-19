var express = require("express");
const Artwork = require("../models/Artwork");
var router = express.Router();
// const Artwork = require('../models/Artwork');
const ArtworksList = require("../models/ArtworksList");
router.get("/",async function(req,res,next){
try { 
    const list =await  ArtworksList.find().sort({updatedAt:-1}).limit(1) ;
     
    //  Array(list[0].artworks).forEach(async (id)=>{
    //     count++;
    //     console.log(art);
        
    //     artworkList.push(art);
    // console.log(count);
    // });
    let artworkslist = [];
    async function getArtworks(){
      
       try{ 
        var artworks = list[0].artworks;
        var id;
        for(let i =0;i<artworks.length;i++){
            id = artworks[i];
            let art =await Artwork.findById(id);
            artworkslist.push(art); 
        }
        
}
    catch(error){
        console.log(error);
    }
    }
    
await getArtworks() ;
   
res.send(artworkslist);

} catch (error) {
    console.log(error);
    res.send(error);
}
});
router.post("/",async function(req,res,next){
    try{
        const popularArtworksList = new ArtworksList({
            "views":req.body.views,
      
            "artworks": req.body.artworks
        
        });
        const listWithID = await popularArtworksList.save("Flutter Backend");
res.send(listWithID);
    }
    catch(e){
        console.log(e);
    }
});

module.exports = router;