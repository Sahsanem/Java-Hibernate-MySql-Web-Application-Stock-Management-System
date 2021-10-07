<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<!doctype html>
<html lang="en">

<head>
    <title>Ödeme Girişi</title>
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
            <small class="h6">Ödeme Giriş Paneli</small>
        </h3>

        <div class="main-card mb-3 card mainCart">
            <div class="card-header cardHeader">Ödeme Girişi</div>
            <a href="payOut.jsp" class="btn btn-danger col-sm-3 " >Ödeme Çıkışı</a>
            <form class="row p-3" id="payment_add_form">

                <div class="col-md-3 mb-3">
                    <label for="mname" class="form-label">Müşteriler</label>
                    <select id="mname" class="selectpicker" data-width="100%" data-show-subtext="true" data-live-search="true">
                        <option data-subtext="">Seçim Yapınız</option>
                        <c:if test="${dbUtil.allCustomerList().size()>0}">
                            <c:forEach items="${dbUtil.allCustomerList()}" var="item">
                                <option value="${item.cu_id}" data-subtext="${item.cu_code}">${item.cu_name}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>


                <div class="col-md-3 mb-3">
                    <label for="m_fis" class="form-label">Müşteri Fişleri</label>
                    <select id="m_fis" class="selectpicker" data-width="100%" data-show-subtext="true" data-live-search="true">
                        <option data-subtext="">Seçim Yapınız</option>
                        <option data-subtext=""></option>
                        <option data-subtext=""></option>
                    </select>
                </div>


                <div class="col-md-3 mb-3">
                    <label for="giris_tutar" class="form-label">Ödeme Tutarı</label>
                    <input type="number" name="giris_tutar" id="giris_tutar" class="form-control" />
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
                        <th>Müşteriler</th>
                        <th>Müşteri Fişleri</th>
                        <th>Ödeme Tutar</th>
                        <th>Ödeme Detay</th>

                        <th class="text-center" style="width: 155px;" >Yönetim</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- for loop  -->
                    <tr role="row" class="odd">
                        <td>Ali Bilmem</td>
                        <td>011</td>
                        <td>200</td>
                        <td>Su Detay</td>

                        <td class="text-right" >
                            <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                <button type="button" class="btn btn-outline-primary "><i class="far fa-trash-alt"></i></button>
                                <button type="button" class="btn btn-outline-primary "><i class="far fa-file-alt"></i></button>
                                <button type="button" class="btn btn-outline-primary "><i class="fas fa-pencil-alt"></i></button>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>


    </div>
</div>
</div>

<jsp:include page="inc/js.jsp"></jsp:include>
<script src="js/payIn.js"></script>
</body>

</html>
