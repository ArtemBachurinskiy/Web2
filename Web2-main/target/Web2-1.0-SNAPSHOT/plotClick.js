document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("plot-svg").addEventListener("click", manageClick)
})

let manageClick = function(e) {
    let svg = document.getElementById("plot-svg")
    let point = svg.createSVGPoint()
    point.x = e.clientX
    point.y = e.clientY
    point = point.matrixTransform(svg.getScreenCTM().inverse())
    try {
        let r = document.querySelector("input[name=r_value]:checked").value
        let x = (point.x - 150) / 100 * r
        let y = (150 - point.y) / 100 * r
        if (validateCoordinates(x, y)) {
            let request = new XMLHttpRequest()
            request.open('POST', 'controller-servlet?x_value=' + x + '&y_value=' + y + '&r_value=' + r, false)
            request.send(null)
            location.reload()
        }
    } catch (e) {
        alert("Can't define coordinates..." + '\n' + "R must be selected!")
    }
}

function validateCoordinates(x, y) {
    if (x < -5 || x > 3) {
        alert("X must be in range [-5; 3]")
        return false
    }
    if (y <= -5 || y >= 5) {
        alert("Y must be in range (-5; 5)")
        return false
    }
    return true
}