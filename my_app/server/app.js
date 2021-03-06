var createError = require('http-errors');
var express = require('express');
var path = require('path');
require('dotenv').config();
const session = require('express-session');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var uid = require('uid-safe');
const popularArtworksRouter = require('./routes/popularArtworks');
const artworkRouter  = require('./routes/artwork');
const { default: mongoose } = require('mongoose');

const app = express();
let connected = false;
 
  mongoose.connect(process.env.DB_URL,{dbName:"FlutterBackend"}).then(()=>{connected=true;
    console.log("Connected to DB")}).
catch((error)=>{connected = false;
  console.log(error)});
 
app.disable('etag');

var cors = require('cors');
const { type } = require('os');

// view engine setup
app.use(cors());
app.set('views', path.join(__dirname, 'views'));//setting templates path
app.set('view engine', 'jade');
app.use(logger('dev'));

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));

app.use(cookieParser());  

app.use('/api/popularArtworks', popularArtworksRouter);
app.use('/api/artwork',artworkRouter);
// app.all("/dashboard", (req, res, next) => {
//     res.send('<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <p> Hi , this is ur test dashboard ')
// })


/*app.use(session({
    secret: [SECRET_KEY]
   
}));
app.set('trust proxy', 1) // trust first proxy
app.use(session({
    name: "session-id",
  secret: [SECRET_KEY], //can add multiple keys later; first one is checked
    resave: true,
    saveUninitialized: true,
    genid:   function (req) {
       return  uid.sync(18)   
    }
    , cookie: { httpOnly: true }
}));
*/

 

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};
 
  // render the error page
  res.status(err.status || 500);
  res.render('error');
});


module.exports = app;