const mongoose = require('mongoose');

 

const ArtworkSchema =new mongoose.Schema(
{
     
        username:{
            type:String,
            require:true,
            min:3,
            max:15,
            unique:true

        },//Image of the artwork
        art:{
            type:String,
            require:true
            , 
        },
        title:{
          type:String,
          require:true
        },
 
          profilePicture: {
            type: String,
            default: "https://firebasestorage.googleapis.com/v0/b/artwork-gallery-ab602.appspot.com/o/images%2Fbeach.jpeg?alt=media&token=76c27891-0904-4b5e-82d2-ed97329a9cad",
          },
           
          
          description: {
            type: String,
            max: 100,
          },
          size:{
            type: Map,
            required: true
          },
          material:{
            type:String,
           
            default:"Paper"
          },
          // Subject and Medium 
          details:{
            type:Map,

          },
          forSell:{
            type:Boolean,
            default:true
          },
          price:{
            type:Number,
            required:true

          },
          currentbid:{
            type:Number,
            default:0
          },
          tags:{
            type:Array,
          },
          likes:{
            type:Number,
            default:0
          },
          comments:{
            type:Array,
        
          },
          shares:{
            type:Number,
            default:0
          },saves:{
            type:Number,
            default:0
          }

 
        },
        { timestamps: true }
   

);

module.exports  = mongoose.model("Artwork", ArtworkSchema)
 
