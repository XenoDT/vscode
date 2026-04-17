const num = getRandom(1,100)
let resp;
alert(num)
while(resp != num){
    resp = prompt()
    if(resp < num){
        alert("mayor")
    } else if(resp > num){
        alert("menor")
    } else if(resp == num){
        alert("correcto")
    }
}   
function getRandom(min,max){
    min = Math.ceil(min)
    max = Math.floor(max)
    return Math.floor(Math.random() * (max - min + 1) + min)
}
                                                                                                                                                                                                     