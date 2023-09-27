var express=require('express');
var app=express();
app.use(express.static('public/'));
var bodyparser=require('body-parser');
app.use(bodyparser.urlencoded({extended:true}));
var upload=require('express-fileupload');
app.use(upload());

var adminRoute=require('./routes/admin');
app.use("/admin",adminRoute);

app.get("/",function(req,res){
    res.send("Running");
});

app.listen(1000);   