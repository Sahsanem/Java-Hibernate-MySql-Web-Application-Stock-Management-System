let select_id = 0
$('#pro_order_add_form').submit( ( event ) => {
    event.preventDefault();

    /*<th>BId</th>
        <th>Ürün</th>
       <th>Fiyat</th>
      <th>Sayı</th>
         <th>Müşteri</th>
     <th>Fiş No</th>*/
    $.ajax({
        url: './order-post',
        type: 'POST',
        data: { },
        dataType: 'JSON',
        success: function (data) {
            if ( data > 0 ) {
                alert("İşlem Başarılı")

            }else {
                alert("İşlem sırasında hata oluştu!");
            }
        },
        error: function (err) {
            console.log(err)
            alert("İşlem işlemi sırısında bir hata oluştu!");
        }
    })



})