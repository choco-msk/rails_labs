function handleResult(event) {
    const [data] = event.detail
    var result = document.getElementById("result");
    if (data.value != "Error") {
        result.innerHTML = "";
        data.value.forEach(function (item, i, arr) {
            result.innerHTML += "<tr><td>" + (i+1) + "</td><td>" + data.value[i]
                + "</td></tr>";
        })
    }
    else {
        result.innerHTML = "";
        result.innerHTML += "<tr><td>Error</td><tr>";
    }
}

document.addEventListener('turbolinks:load', () => {
    document.getElementById('input_form')
        .addEventListener('ajax:success', handleResult)
})