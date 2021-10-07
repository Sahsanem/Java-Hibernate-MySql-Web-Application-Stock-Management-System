//Products
let select_id = 0
$('#product_add_form').submit( (event) => {
    event.preventDefault();

    const p_title=$("#p_title").val()
    const a_price=$("#a_price").val()
    const o_price=$("#o_price").val()
    const p_code=$("#p_code").val()
    const p_tax=$("#p_tax").val()
    const p_section=$("#p_section").val()
    const p_size=$("#p_size").val()
    const p_detail=$("#p_detail").val()

    const obj = {
        ptitle:p_title,
        aprice:a_price,
        oprice:o_price,
        pcode:p_code,
        ptax:p_tax,
        psection:p_section,
        psize:p_size,
        pdetail:p_detail

    }
    if ( select_id != 0 ) {
        // update
        obj["pid"] = select_id;
    }

    $.ajax({
        url:'./product-post',
        type:'POST',
        data:{ obj : JSON.stringify(obj)  },
        dataType:'JSON',
        success:function (data){
            if(data>0) {
                alert("Ekleme başarılı")
                $('#product_add_form').trigger("reset");
                fncReset();
            }else{
                alert("Ekleme sırasında hata oluştu")
            }
        },
        error:function (err){
            console.log(err)
            alert("Kayıt sırasında bir hata oluştu");
        }
    })


})
function allProduct(){
    $.ajax({
        url: './product-get',
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

      let newtax=""
        if(itm.ptax==1){
            newtax='%1'
        }
        else if(itm.ptax==2){
            newtax='%8'
        }
        else if(itm.ptax==3){
            newtax='%18'
        }
        const ptax=newtax;

        let newsection=""
        if(itm.psection==0){
            newsection='Adet'
        }
        else if(itm.psection==1){
            newsection='KG'
        }
        else if(itm.psection==2){
            newsection='Metre'
        }
        else if(itm.psection==3){
            newsection='Paket'
        }
        else if(itm.psection==4){
            newsection='Litre'
        }
        const psection=newsection;

        html += `<tr role="row" class="odd">
             <td>`+itm.pid+`</td>
            <td>`+itm.ptitle+`</td>
            <td>`+itm.aprice+`</td>
            <td>`+itm.oprice+`</td>
            <td>`+itm.pcode+`</td>
            <td>`+ prt +`</td>
            <td>`+prt2+`</td>
            <td>`+itm.psize+`</td>
            <td>`+itm.pdetail+`</td>
                        <td class="text-right" >
                            <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                <button onclick="fncProductDelete(`+itm.pid+`)" type="button" class="btn btn-outline-primary "><i class="far fa-trash-alt"></i></button>
                                <button onclick="fncProductDetail(`+i+`)" data-bs-toggle="modal" data-bs-target="#ProductDetailModel" type="button" class="btn btn-outline-primary "><i class="far fa-file-alt"></i></button>
                                <button onclick="fncProductUpdate(`+i+`)" type="button" class="btn btn-outline-primary "><i class="fas fa-pencil-alt"></i></button>
                            </div>
                        </td>
                    </tr>`;
    }
    $('#tableRow').html(html);
}
function codeGenerator() {
    const date = new Date();
    const time = date.getTime();
    const key = time.toString().substring(4);
    $('#ccode').val( key )
    $('#pcode').val( key )
}
allProduct();
// reset fnc
function fncReset() {
    select_id = 0;
    $('#product_add_form').trigger("reset");
    codeGenerator();
    allProduct();
}
function fncProductDelete(pid){
    let answer = confirm("Silmek istediğinizden emin misniz?");
    if ( answer ) {

        $.ajax({
            url: './delete-product?pid='+pid,
            type: 'DELETE',
            dataType: 'text',
            success: function (data) {
                if ( data != "0" ) {

                    fncReset();
                }else {
                    alert("Silme sırasında bir hata oluştu!");
                }
            },
            error: function (err) {
                console.log(err)
            }
        })
    }
}

function fncProductDetail( i ){
    const itm = globalArr[i];
    $("#ptitle").text(itm.ptitle);
    $("#aprice").text(itm.aprice);
    $("#oprice").text(itm.oprice);
    $("#pcode").text(itm.pcode);
    $("#ptax").text(itm.ptax);
    $("#psection").text(itm.psection);
    $("#psize").text(itm.psize);
    $("#pdetail").text(itm.pdetail);

}
function fncProductUpdate( i ){
    const itm = globalArr[i];
    select_id = itm.pid
    $("#p_title").val(itm.ptitle);
    $("#a_price").val(itm.aprice);
    $("#o_price").val(itm.oprice);
    $("#p_code").val(itm.pcode);
    $("#p_tax").val(itm.ptax);
    $("#p_section").val(itm.psection);
    $("#p_size").val(itm.psize);
    $("#p_detail").val(itm.pdetail);
}