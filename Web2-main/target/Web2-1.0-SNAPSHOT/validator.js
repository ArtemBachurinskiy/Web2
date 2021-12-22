let xvalue = "";
function onchangeOfCbx(obj) {
    const cbs = document.getElementsByClassName("cbx");
    obj.disabled = false
    for (let i = 0; i < cbs.length; i++) {
        if (obj !==  cbs[i])
            cbs[i].disabled = obj.checked;
    }
    if (obj.checked === true)
        xvalue = obj.value
    else
        xvalue = ""
}

let rvalue = "";
function onchangeOfCbr(obj) {
    const cbs = document.getElementsByClassName("cbr");
    obj.disabled = false
    for (let i = 0; i < cbs.length; i++) {
        if (obj !==  cbs[i])
            cbs[i].disabled = obj.checked;
    }
    if (obj.checked === true)
        rvalue = obj.value
    else
        rvalue = ""
}

function validateX(x) {
    // (!!) - синтаксис приведения к булеву значению
    if (!x.trim())
        return [false, "X is required"]
    const xValues = [-5, -4, -3, -2, -1, 0, 1, 2, 3]
    // (+x) - синтаксис приведения строки к числу
    if (!xValues.includes(+x))
        return [false, "X must be one of the following: -5, -4, -3, -2, -1, 0, 1, 2, 3"]
    return [true]
}

function validateY(y) {
    if (!y.trim())
        return [false, "Y is required"]
    if (+y != y)
        return [false, "Y must be a number"]
    if (+y <= -5 || +y >= 5)
        return [false, "Y must be in range (-5; 5)"]
    return [true]
}

function validateR(r) {
    if (!r.trim())
        return [false, "R is required"]
    const rValues = [1, 1.5, 2, 2.5, 3]
    if (!rValues.includes(+r))
        return [false, "R must be one of the following: 1, 1.5, 2, 2.5, 3"]
    return [true]
}

document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("submit_button").addEventListener("click", submit)
})

function submit (event) {
     const [resX, messageX] = validateX(xvalue)
     const [resY, messageY] = validateY(document.getElementsByName("y_value")[0].value)
     const [resR, messageR] = validateR(rvalue)
     if (!resY || !resX || !resR) {
         event.preventDefault()
         messageX && alert(messageX)
         messageY && alert(messageY)
         messageR && alert(messageR)
     } else {
         xvalue = ""
         rvalue = ""
     }
}