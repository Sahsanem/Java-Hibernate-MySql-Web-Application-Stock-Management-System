function ProductLimit() {

    $.ajax({
        url: './dashboard-get',
        type: 'GET',
        dataType: 'Json',
        success: function (data) {
            createRow(data);
        },
        error: function (err) {
            console.log(err)
        }
    })

}

let globalArr = []
function createRow( data ) {
    globalArr = data;
    let html = ``
    for (let i = 0; i < data.length; i++) {
        const itm = data[i];

        html += `<tr role="row" class="odd">
            <td>`+itm.pid`</td>
            <td>`+itm.pcode+`</td>
            <td>`+itm.ptitle+`</td>
            <td>`+itm.aprice+`</td>
            <td class="text-right" >
            </td>
          </tr>`;
    }
    $('#tableRow').html(html);
}