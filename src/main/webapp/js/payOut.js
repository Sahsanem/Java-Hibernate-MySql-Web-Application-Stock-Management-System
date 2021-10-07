let select_id = 0
$('#payout_add_form').submit( ( event ) => {
  event.preventDefault();

  const odeme_title= $("#odeme_title").val()
  const cikis_tutar = $("#cikis_tutar").val()
  const otype = $("#otype").val()
  const odeme_detay = $("#odeme_detay").val()

  const obj={
    payment_title:odeme_title,
    payout_payment_total:cikis_tutar,
    payment_type:otype,
    payout_payment_detail:odeme_detay
  }

  $.ajax({
    url: './payout-post',
    type: 'POST',
    data: { obj: JSON.stringify(obj) },
    dataType: 'JSON',
    success: function (data) {
      if ( data > 0 ) {
        alert("İşlem Başarılı")
        allPayOut();
        alert("ALL")
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

function allPayOut() {

    $.ajax({
      url: './payout-get',
      type: 'GET',
      dataType: 'Json',
      success: function (data) {
        createRow(data);
        alert("Create row")
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
      const paytype = itm.ptax == 1 ? 'Nakit': itm.ptax==2 ? 'Havale ': 'Banka Çeki'
      html += `<tr role="row" class="odd">
            <td>`+itm.payment_title+`</td>
            <td>`+itm.payout_payment_total+`</td>
            <td>`+paytype+`</td>
            <td>`+itm.payout_payment_detail+`</td>
         
            <td class="text-right" >
              <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                <button onclick="fncPayOutDelete(`+itm.payout_id+`)" type="button" class="btn btn-outline-primary "><i class="far fa-trash-alt"></i></button>
                <button onclick="fncPayOutDetail(`+i+`)" data-bs-toggle="modal" data-bs-target="#payoutDetailModel" type="button" class="btn btn-outline-primary "><i class="far fa-file-alt"></i></button>
                <button onclick="fncPayOutUpdate(`+i+`)" type="button" class="btn btn-outline-primary "><i class="fas fa-pencil-alt"></i></button>
              </div>
            </td>
          </tr>`;
    }
    $('#tableRow').html(html);
  }
  alert("Tablo")
allPayOut();
function fncPayOutDelete( payout_id ) {
  let answer = confirm("Silmek istediğinizden emin misniz?");
  if ( answer ) {

    $.ajax({
      url: './payout-delete?payout_id='+payout_id,
      type: 'DELETE',
      dataType: 'text',
      success: function (data) {
        if ( data != "0" ) {
          allPayOut();
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

function fncPayOutDetail(i){
  const itm = globalArr[i];
  $("#payment_title").text(itm.payment_title);
  $("#payout_payment_total").text(itm.payout_payment_total);
  $("#payment_type").text(itm.payment_type);
  $("#payout_payment_detail").text(itm.payout_payment_detail);

}

function fncPayOutUpdate( i ) {
  const itm = globalArr[i];
  select_id = itm.cu_id
  $("#odeme_title").val(itm.payment_title)
  $("#cikis_tutar").val(itm.payout_payment_total)
  $("#otype").val(itm.payment_type)
  $("#odeme_detay").val(itm.payout_payment_detail)


}

