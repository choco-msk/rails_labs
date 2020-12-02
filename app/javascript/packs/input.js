function handleResult(event) {
    const [data] = event.detail
    var result = document.getElementById("result");
    result.innerHTML = "";
    data.value.forEach(function (item, i, arr) {
        result.innerHTML += "<tr><td>" + i + "</td><td>" + data.value[i]
            + "</td></tr>";
    })
}

document.addEventListener('turbolinks:load', () => {
    document.getElementById('input_form')
        .addEventListener('ajax:success', handleResult)
})