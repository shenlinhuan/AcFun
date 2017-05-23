<?php
    /*
    该pgp页面用于myorder.html
    获取客户端提交的电话号码,返回该号码对应的所有订单
    以JSON格式
    */
    $output = [];
    @$phone = $_REQUEST['phone'];
    if( !$phone ){
        echo '[]';
        return;
    }
    $conn=mysqli_connect('127.0.0.1','root','','acfun','3306');
    $sql='SET NAMES UTF8';
    mysqli_query($conn,$sql);
    $sql="SELECT oid,user_name,sex,order_time,addr,img_sm,o.did FROM ac_order o,ac_goods d WHERE phone='$phone' AND o.did=d.did ORDER BY o.order_time DESC";
    $result=mysqli_query($conn,$sql);
    while( ($row=mysqli_fetch_assoc($result))!==NULL ){  //一行一行的读取数据
        $output[]=$row;
    }
    echo json_encode($output);
?>