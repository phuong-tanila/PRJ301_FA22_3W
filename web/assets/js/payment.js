
function showForm() {
    document.getElementById("form-visa").style.display = "block"
    document.getElementById("form-bank").style.display = "none"

}



function closeForm() {
    document.getElementById("form-bank").style.display = "none"
    document.getElementById("form-visa").style.display = "none"
}

// var y = document.getElementById("shipper-ahamove").alt;


function closeButton(e, index) {
    e.parentElement.style.display = "none"
    document.querySelectorAll('.card-item')[index].querySelector('input[type=radio]').checked = false

}

