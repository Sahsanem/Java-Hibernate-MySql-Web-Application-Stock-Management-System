$('#check_out_form_add').submit( ( event ) => {
    event.preventDefault();

    const cname = $("#cname").val()
    const ctype = $("#ctype").val()
    const startDate = $("#startDate").val()
    const endDate = $("#endDate").val()

    const obj={
        check_cu_id:cname,
        type:ctype,
        b_date:startDate,
        l_date:endDate
    }



});