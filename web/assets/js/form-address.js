$(".input-district").on("focus", () => {
    $(".list-district").show();
    $(".option-district").on("click", function () {
        $("#district-value").val($(this).text())
        hideListDistrict();
    })
})
//}
//function showWards() {
$(".input-wards").on("focus", () => {
    $(".list-wards").show();
    $(".option-wards").on("click", function () {
        $("#wards-value").val($(this).text())
        hideListWard();
    })
})

//Ẩn List khi không đúng class
function hideListCity() {
    $(".list-city").hide();
}
function hideListDistrict() {
    $(".list-district").hide();
}
function hideListWard() {
    $(".list-wards").hide();
}
//function showCity() {
$(".input-city").on("focus", () => {
    $(".list-city").show();
    $(".option-city").on("click", function () {
        $("#city-value").val($(this).text())
        hideListCity();
    })

})
//}
document.addEventListener("click", (event) => {
    let classList = event.target.classList;
    // console.log(classList)
    if (
        classList.contains("input-city") ||
        classList.contains("list-city") ||
        classList.contains("option-city")
    ) {
        return

    } else {
        hideListCity();
    }
})

//DISTRICT
document.addEventListener("click", (event) => {
    let classList = event.target.classList;
    if (
        classList.contains("input-district") ||
        classList.contains("list-district") ||
        classList.contains("option-district")
    ) {
        showDistrict();
    } else {
        hideListDistrict();
    }
})
//WARDS
document.addEventListener("click", (event) => {
    let classList = event.target.classList;
    if (
        classList.contains("input-wards") ||
        classList.contains("list-wards") ||
        classList.contains("option-wards")
    ) {
        showWards();
    } else {
        hideListWard()
    }
})

