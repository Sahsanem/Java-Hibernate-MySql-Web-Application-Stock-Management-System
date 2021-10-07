<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
    <title>Ödeme Çıkışı</title>
    <jsp:include page="inc/css.jsp"></jsp:include>
</head>

<body>

<div class="wrapper d-flex align-items-stretch">
    <jsp:include page="inc/sideBar.jsp"></jsp:include>

    <!-- Page Content  -->
    <div id="content" class="p-4 p-md-5">

        <jsp:include page="inc/topMenu.jsp"></jsp:include>

        <h3 class="mb-3">
            Kasa
            <small class="h6">Ödeme Çıkış Paneli</small>
        </h3>

        <div class="main-card mb-3 card mainCart">
            <div class="card-header cardHeader">Ödeme Çıkışı</div>

            <form class="row p-3" id="payout_add_form">

                <div class="col-md-3 mb-3">
                    <label for="odeme_title" class="form-label">Ödeme Başlığı</label>
                    <input type="text" name="odeme_title" id="odeme_title" class="form-control" />
                </div>
                <div class="col-md-3 mb-3">
                    <label for="cikis_tutar" class="form-label">Ödeme Tutarı</label>
                    <input type="number" name="cikis_tutar" id="cikis_tutar" class="form-control" />
                </div>

                <div class="col-md-3 mb-3">
                    <label for="otype" class="form-label">Ödeme Türü</label>
                    <select class="form-select" name="otype" id="otype">
                        <option value="0" >Seçiniz</option>
                        <option value="1">Nakit</option>
                        <option value="2">Havale</option>
                        <option value="3">Banka Çeki</option>

                    </select>
                </div>


                <div class="col-md-3 mb-3">
                    <label for="odeme_detay" class="form-label">Ödeme Detay</label>
                    <input type="text" name="odeme_detay" id="odeme_detay" class="form-control" />
                </div>


                <div class="btn-group col-md-3 " role="group">
                    <button type="submit" class="btn btn-outline-primary mr-1">Gönder</button>
                    <button type="reset" class="btn btn-outline-primary">Temizle</button>
                </div>
            </form>
        </div>


        <div class="main-card mb-3 card mainCart">
            <div class="card-header cardHeader">Ödeme Listesi</div>

            <div class="row mt-3" style="padding-right: 15px; padding-left: 15px;">
                <div class="col-sm-3"></div>
                <div class="col-sm-3"></div>
                <div class="col-sm-3"></div>
                <div class="col-sm-3">
                    <div class="input-group flex-nowrap">
                        <span class="input-group-text" id="addon-wrapping"><i class="fas fa-search"></i></span>
                        <input type="text" class="form-control" placeholder="Arama.." aria-label="Username" aria-describedby="addon-wrapping">
                        <button class="btn btn-outline-primary">Ara</button>
                    </div>
                </div>



            </div>
            <div class="table-responsive">
                <table class="align-middle mb-0 table table-borderless table-striped table-hover">
                    <thead>
                    <tr>
                        <th>Ödeme Başlığı</th>
                        <th>Ödeme Tutar</th>
                        <th>Ödeme Tür</th>
                        <th>Ödeme Detay</th>

                        <th class="text-center" style="width: 155px;" >Yönetim</th>
                    </tr>
                    </thead>
                    <tbody id="tableRow">
                    <!-- for loop  -->

                    </tbody>
                </table>
            </div>
        </div>


    </div>
</div>
</div>

<jsp:include page="inc/js.jsp"></jsp:include>
<script src="js/payOut.js"></script>

</body>

</html>

