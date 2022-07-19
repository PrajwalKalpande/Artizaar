const mongoose = require('mongoose');
const artwork = require("./Artwork.js").schema;
const {Schema}= mongoose;

const ArtworksListSchema =new mongoose.Schema(
 {
    views:{
        type:Number,
        default:0
    },
    sold:{ type:Number,
        default:0},
        artworks:  [{type:Schema.Types.ObjectId,ref:"Artwork"}],
           
        
         

 },{ timestamps: true }
 

);

module.exports = mongoose.model("ArtworksList", ArtworksListSchema)
