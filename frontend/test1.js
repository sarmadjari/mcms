function getCustomerName1(){
    var q = document.getElementById('customer_name').value;
    //document.getElementById("root").innerHTML = getData(q1);
    //document.getElementById("root").innerHTML = test0(q1);
    //var res = getCustomerNameFromAPI(q)
    var res = getFile(q)
    console.log("=getData res: "+res);
    document.getElementById("root").innerHTML = res;
    //generateList(q1,"root");
}

async function gD(q) {

  // read github user
  let githubResponse = await fetch("http://localhost/api.php?customer_name="+q);
  let githubUser = await githubResponse.json();
  await new Promise((resolve, reject) => setTimeout(resolve, 3000));

  return githubUser;
}

async function getFile(q) {
    let myPromise = new Promise(function(resolve) {
      let req = new XMLHttpRequest();
      req.open('GET', "http://localhost/api.php?customer_name="+q);
      req.onload = function() {
        if (req.status == 200) {
          resolve(req.response);
        } else {
          resolve("File not Found");
        }
      };
      req.send();
    });
    //document.getElementById("root").innerHTML = await myPromise;
    return await myPromise;
  }


async function getData(q) {
    const response = await fetch('http://localhost/api.php?customer_name='+q, { mode: 'no-cors', headers : {'Content-Type': 'application/json', 'Accept': 'application/json'}});
    //console.log("=getData1: "+response);
    const data = await response.json();
    //console.log("=getData2: "+data);
    const str = JSON.stringify(data);
    //console.log("=getData3: "+myJSON);
    return str;
}

function test0(q){
    const fetchPromise = fetch("http://localhost/api.php?customer_name="+q);
    fetchPromise.then(response => {
      console.log(response);
      return response;
    });
    }

function test2(){
    fetch('http://time.jsontest.com')
    .then(res => res.json())
    .then((out) => {
        console.log('Output: ', out);
        return JSON.stringify(out);
    }).catch(err => console.error(err));
}

function getCustomerNameFromAPI(q){
    if (q.length > 1) {
        re = fetch('http://localhost/api.php?customer_name='+q)
        .then(res => res.json())
        .then((out) => {
            console.log('Output(',typeof out,'): ', out);
            x = JSON.stringify(out);
            console.log('String(',typeof x,'): ', x);
            //return x;
        }).catch(err => console.error(err));
        return re;
    }
    else return null;
}

function generateList(text,elementId)
{

    var listContainer = document.getElementById(elementId);
    listContainer.innerHTML = null;

    if (text.length > 1) {

        fetch('http://localhost/api.php?customer_name='+text)
        .then(res => res.json())
        .then((out) => {
            console.log('Output: ', out);
            const r = JSON.stringify(out);
            console.log('String: ', r);
        }).catch(err => console.error(err));
       
        console.log('generateList1: ', r);
      
        var newList = document.createElement("ul");
        var newListItem = document.createElement("li");
        newListItem.innerHTML = text;
        
        newList.appendChild(newListItem);
        listContainer.appendChild(newList);
        }
    
    
    
    
    

    

/*
    var newList = document.createElement("ul");


    for(var i = 0 ; i < jObject.customers.length ; i ++)
        {

            var newListItem = document.createElement("li");

            newListItem.innerHTML = jObject.customers[i];

            newList.appendChild(newListItem);

        }

    listContainer.appendChild(newList);
*/

}