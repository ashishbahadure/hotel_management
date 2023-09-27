var express=require('express');
var router=express.Router();
var execute=require('./../dbconnection');
var query=require('./../query');

function getvalidmonth(cdate)
{
    var month=cdate.getMonth()+1;
    if(month<10)
    {
        return "0"+month;
    }
    else
    {
        return month;
    }
}

router.get("/",async function(req,res)
{
    var date=new Date();
    var today=date.getFullYear()+"-"+getvalidmonth(date)+"-"+date.getDate();

    var data=await execute("SELECT SUM(order_amt) FROM order_tbl WHERE order_date='"+today+"'");
    console.log(data);
    res.render('admin/home.ejs');
});
router.get("/add_category",async function(req,res)
{
    var data=await query.select("category");
    res.render('admin/add_category.ejs',{'cat_list':data});
});
router.post("/savecategory",async function(req,res)
{
    var data=await query.insert('category',req.body)
    res.redirect("/admin/add_category");
})
router.get("/add_dish",async function(req,res)
{
    var cat_list=await query.select("category");
    res.render("admin/add_dish.ejs",{'cat_list':cat_list});
});
router.post("/savedish",async function(req,res){
    console.log(req.files);
    req.body.dish_image=req.files.dish_image.name;
    req.files.dish_image.mv('public/uploads/'+req.files.dish_image.name);
    var data=await query.insert("dish",req.body);
    res.redirect("/admin/add_dish");
});
router.get("/dish_list",async function(req,res)
{
    var data=await execute("SELECT * FROM dish,category WHERE dish.category_id=category.category_id");

    res.render("admin/dish_list.ejs",{'dishes':data});
});
router.get("/add_table",async function(req,res)
{
    var table_list=await query.select("hotel_table");
    res.render("admin/add_table.ejs",{'table_list':table_list});
});
router.post("/savetable",async function(req,res){
    req.body.status='free';
    var data=await query.insert("hotel_table",req.body);
    res.redirect("/admin/add_table");
});
router.get("/add_customer",function(req,res){
    res.render("admin/add_customer.ejs");
})
router.post("/savecustomer",async function(req,res){
    var data=await query.insert("customer",req.body);
    res.redirect("/admin/add_customer");
});
router.get("/customer_list",async function(req,res){
    var data=await query.select("customer");
    res.render("admin/customer_list.ejs",{'cust_lsit':data});
});
router.get("/create_order",async function(req,res){
    var tables=await query.select("hotel_table");
    res.render('admin/create_order.ejs',{'tables':tables});
});
router.get("/create_order2/:table_id",async function(req,res)
{
    var hotel_table_id=req.params.table_id;
    var table_info=await query.select_where("hotel_table",{'hotel_table_id':hotel_table_id});
    var dish_list=await query.select("dish");

    var orderDetails=await query.select_where('order_tbl',{'hotel_table_id':hotel_table_id,'status':'processing'});

    if(orderDetails[0])
        var orderDishes=await query.select_where('order_dishes',{'order_id':orderDetails[0]['order_tbl_id']});
    else
        var orderDishes=[];
        
    res.render("admin/create_order2.ejs",{'table_info':table_info,'dish_list':dish_list,'orderDetails':orderDetails,'orderDishes':orderDishes});
})
router.post("/get_price_by_ajax",async function(req,res){
    var dish_info=await query.select_where("dish",req.body);
    res.send(dish_info);
});

router.post("/saveorder",async function(req,res)
{
    
    var orderDetails=await query.select_where('order_tbl',{'hotel_table_id':req.body.hotel_table_id,'status':'processing'});
    if(orderDetails[0])
    {
        var order_id=orderDetails[0].order_tbl_id;
    }
    else
    {
        var date=new Date();
        var order={
            customer_id:'',
            hotel_table_id:req.body.hotel_table_id,
            order_amt:'',
            paid_amt:'',
            pending_amt:'',
            order_date:date.getFullYear()+"-"+getvalidmonth(date)+"-"+date.getDate(),
            entry_time:date.getHours()+":"+date.getMinutes(),
            exit_time:'',
            status:'processing'
        }
        var data=await query.insert('order_tbl',order);
        var order_id=data.insertId;
    }
    var dish_det=await query.select_where('dish',{'dish_id':req.body.dish_id});
    
    // order_dishes_id,
    var orderdishobj={
        'order_id':order_id,
        'dish_id':req.body.dish_id,
        'dish_name':dish_det[0].dish_name,
        'dish_price':req.body.dish_rate,
        'dish_qty':req.body.dish_qty,
        'dish_total':req.body.dish_total,
        'dish_image':dish_det[0].dish_image,
        'dish_details':dish_det[0].dish_details
    };
    await execute("UPDATE hotel_table SET status='allocate' WHERE hotel_table_id='"+req.body.hotel_table_id+"'");
    var data=await query.insert("order_dishes",orderdishobj);
    res.send({'status':'success'});
    // res.redirect('create_order2/'+req.body.hotel_table_id);
});
router.post("/removedish_by_ajax",async function(req,res){
    var data=await execute("DELETE FROM order_dishes WHERE order_dishes_id='"+req.body.dish_id+"'");

    res.send({'status':'success','message':'Record Deleted'});
});
router.post("/getOrderDishes_by_ajax",async function(req,res)
{
    
    var orderDetails=await query.select_where('order_tbl',{'hotel_table_id':req.body.hotel_table_id,'status':'processing'});

    if(orderDetails[0])
        var orderDishes=await query.select_where('order_dishes',{'order_id':orderDetails[0]['order_tbl_id']});
    else
        var orderDishes=[];
      
    res.send({'status':'success','order_dishes':orderDishes});
});
router.post("/savebill",async function(req,res){
    var orderDetails=await query.select_where('order_tbl',{'hotel_table_id':req.body.hotel_table_id,'status':'processing'});
    var date=new Date();
    var data=await execute(`UPDATE order_tbl SET 
                            order_amt='${req.body.order_amt}',
                            paid_amt='${req.body.paid_amt}',
                            pending_amt='${req.body.pending_amt}',
                            exit_time='${date.getHours()}:${date.getMinutes()}',
                            status='complete'
                            WHERE order_tbl_id='${orderDetails[0].order_tbl_id}'
                            `);
    var udatetable=await execute("UPDATE hotel_table SET status='free' WHERE hotel_table_id='"+req.body.hotel_table_id+"'");
    res.redirect("/admin/printbill/"+orderDetails[0].order_tbl_id);
});
router.get("/printbill/:order_id",async function(req,res)
{
    var order_id=req.params.order_id;
    var orderDetails=await query.select_where('order_tbl',{'order_tbl_id':order_id});

    var orderDishes=await query.select_where('order_dishes',{'order_id':order_id});
    console.log(orderDetails);
    res.render(`admin/print_bill.ejs`,{'orderDetails':orderDetails,'orderDishes':orderDishes});
});
router.get("/order_list",async function(req,res)
{
    var data=await execute("SELECT * FROM order_tbl,hotel_table WHERE order_tbl.hotel_table_id=hotel_table.hotel_table_id ORDER BY order_tbl_id DESC");
    res.render("admin/order_list.ejs",{'data':data});
});
module.exports = router;


