<?php
 
header("Content-Type:application/json");
header('Access-Control-Allow-Origin: *');
header('Server: Nginx');
header('X-Powered-By: PHP');
include('connection.php');

$response = array();

/*
if (isset($_GET['customer_id']) && $_GET['customer_id']!="") {
 
 $customer_id = $_GET['customer_id'];
 $query = "SELECT * FROM `customers` WHERE customer_id=$customer_id";
 $result = mysqli_query($con,$query);
 $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
 
 $customerData['customer_id'] = $row['customer_id'];
 $customerData['customer_name'] = $row['customer_name'];
 $customerData['customer_email'] = $row['customer_email'];
 $customerData['customer_contact'] = $row['customer_contact'];
 $customerData['customer_address'] = $row['customer_address'];
 $customerData['country'] = $row['country'];
 
 $response["status"] = "true";
 $response["message"] = "Customer Details";
 $response["customers"] = $customerData;
 
} else {
 $response["status"] = "false";
 $response["message"] = "No customer(s) found!";
}
echo json_encode($response); exit;
*/

if (isset($_GET['customer_id']) && $_GET['customer_id']!="") {
 
    $customer_id = $_GET['customer_id'];
    $query = "SELECT * FROM `customers` WHERE customer_id=$customer_id";
    $result = mysqli_query($con,$query);
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    
    $customerData['customer_id'] = $row['customer_id'];
    $customerData['customer_name'] = $row['customer_name'];
    $customerData['customer_email'] = $row['customer_email'];
    $customerData['customer_contact'] = $row['customer_contact'];
    $customerData['customer_address'] = $row['customer_address'];
    $customerData['country'] = $row['country'];
    
    $response["status"] = "true";
    $response["message"] = "Customer Details";
    $response["customers"] = $customerData;

    echo json_encode($response);
    exit;

   }

   if (isset($_GET['customer_name']) && $_GET['customer_name']!="") {
 
    $customer_name  = $_GET['customer_name'];
    $query          = "SELECT `customer_id`,`customer_name` FROM `customers` WHERE `customer_name` LIKE '%$customer_name%';";
    $result         = mysqli_query($con,$query);
    //$rows           = mysqli_fetch_array($result,MYSQLI_ASSOC);

    $loopExecuted = false;
    while($row = mysqli_fetch_array($result,MYSQLI_ASSOC)) { 
        $loopExecuted = true;
        $a=array($row['customer_id'],$row['customer_name']);
        $b[] = $a;
    }
    if (!$loopExecuted) {
        $response["status"] = "false";
        $response["message"] = "No customer(s) found!";
        echo json_encode($response);
        exit;
    }

    $response["status"]     = "true";
    $response["message"]    = "Customer Names";
    $response["customers"]  = $b;

    echo json_encode(array($response));
    exit;
    
   }
   
   $response["status"] = "false";
   $response["message"] = "No customer(s) found!";
   echo json_encode($response);
   exit;
 
?>