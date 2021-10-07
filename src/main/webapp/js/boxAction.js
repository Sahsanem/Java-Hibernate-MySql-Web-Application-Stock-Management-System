let select_id = 0
$('#order_add_form').submit( ( event ) => {
    event.preventDefault();

    const cname=$("#cname").val()
    const pname=$("#pname").val()
    const count=$("#count").val()
    const bNo=$("#bNo").val()

    const obj = {
        box_customer_id:cname,
        box_product_id:pname,
        adet:count,
        fisNo:bNo
    }
    if ( select_id != 0 ) {
        obj["bid"] = select_id;
    }

    $.ajax({
        url:'./boxAction-post',
        type:'POST',
        data:{ obj : JSON.stringify(obj)  },
        dataType:'JSON',
        success:function (data){
            if(data>0) {
                alert("Ekleme başarılı")
                allBox();
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

    $('#cname').change(function () {
        allBox(this.value);
    })


    function allBox(bid) {
        $.ajax({
            url: './boxAction-get?bid='+bid,
            type: 'GET',
            dataType: 'JSON',
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
            <td>`+itm.bid+`</td>
            <td>`+itm.ptitle +`</td>
            <td>`+itm.oprice +`</td>
            <td>`+itm.adet +`</td>
            <td>`+itm.cu_name +`</td>
            <td>`+itm.fisNo +`</td>
           
            <td class="text-right" >
              <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                <button onclick="fncBoxDelete(`+itm.bid+`)" type="button" class="btn btn-outline-primary "><i class="far fa-trash-alt"></i></button>
         
              </div>
            </td>
          </tr>`;
        }
        $('#tableRow').html(html);
    }



    function fncBoxDelete( bid ) {
        let answer = confirm("Silmek istediğinizden emin misniz?");
        if ( answer ) {

            $.ajax({
                url: './boxAction-delete?bid='+bid,
                type: 'DELETE',
                dataType: 'text',
                success: function (data) {
                    if ( data != "0" ) {
                        allBox(bid);
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











