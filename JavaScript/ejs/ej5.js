const num = prompt("Introduce un numero")

let num2 = 1;
let res = [];
while(num2 != 11){
    let ass = num2*num
    res.push(`${num2} x ${num} = ${ass}`)
    num2++
}
alert(`${res}`)