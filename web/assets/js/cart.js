let minus = document.querySelectorAll("#minus");
let plus = document.querySelectorAll("#plus");
let valueInput = document.querySelectorAll("#input");
minus.forEach(btn => {
    btn.addEventListener('click', () => {
        btn.nextElementSibling.value = (btn.nextElementSibling.value == 0) ? 0 : btn.nextElementSibling.value - 1;
    })
})


plus.forEach(btn => {
    btn.addEventListener('click', () => {
        btn.previousElementSibling.value++;
    })
})

