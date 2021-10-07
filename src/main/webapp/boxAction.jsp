<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<!doctype html>
<html lang="en">

<head>
    <title>Yönetim</title>
    <jsp:include page="inc/css.jsp"></jsp:include>
</head>

<body>
<div class="wrapper d-flex align-items-stretch">
    <jsp:include page="inc/sideBar.jsp"></jsp:include>
    <!-- Page Content  -->
    <div id="content" class="p-4 p-md-5">
        <jsp:include page="inc/topMenu.jsp"></jsp:include>
        <h3 class="mb-3">
            Satış Yap
            <small class="h6">Satış Yönetim Paneli</small>
        </h3>

        <div class="main-card mb-3 card mainCart">
            <div class="card-header cardHeader">Yeni Satış</div>

            <form class="row p-3" id="order_add_form">
                <div class="col-md-3 mb-3">
                    <label for="cname" class="form-label">Müşteriler</label>
                    <select name="customer_select" id="cname" class="selectpicker" data-width="100%" data-show-subtext="true" data-live-search="true" required>
                        <option value="0">Seçim Yapınız</option>
                        <c:if test="${dbUtil.allCustomerList().size()>0}">
                            <c:forEach items="${dbUtil.allCustomerList()}" var="item">
                                <option value="${item.cu_id}" data-subtext="${item.cu_code}">${item.cu_name}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>

                <div class="col-md-3 mb-3">
                    <label for="pname" class="form-label">Ürünler</label>
                    <select id="pname" class="selectpicker" data-width="100%" data-show-subtext="true" data-live-search="true" required>
                        <option data-subtext="">Seçim Yapınız</option>
                        <c:if test="${dbUtil.allProductList().size()>0}">
                            <c:forEach items="${dbUtil.allProductList()}" var="item">
                                <option value="${item.pid}" data-subtext="${item.pcode}">${item.ptitle}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>


                <div class="col-md-3 mb-3">
                    <label for="count" class="form-label">Adet</label>
                    <input id="count" name="count" type="number" min="1" max="100" id="count" class="form-control" required/>
                </div>


                <div class="col-md-3 mb-3">
                    <label for="bNo" class="form-label">Fiş No</label>
                    <input type="text" min="1" max="100" name="bNo" id="bNo" class="form-control"  required/>
                </div>

                <div class="btn-group col-md-3 " role="group">
                    <button type="submit" class="btn btn-outline-primary mr-1">Ekle</button>
                </div>
            </form>
        </div>


        <div class="main-card mb-3 card mainCart">
            <div class="card-header cardHeader">Sepet Ürünleri</div>

            <div class="table-responsive">
                <table class="align-middle mb-0 table table-borderless table-striped table-hover">
                    <thead>
                    <tr>
                        <th>BId</th>
                        <th>Ürün</th>
                        <th>Fiyat</th>
                        <th>Sayı</th>
                        <th>Müşteri</th>
                        <th>Fiş No</th>
                        <th class="text-center" style="width: 55px;" >Sil</th>
                    </tr>
                    </thead>
                    <tbody id="tableRow">
                    <!-- for loop  -->
                    </tbody>
                </table>
            </div>
        </div>

        <form id="pro_order_add_form">
            <div class="btn-group col-md-3 " role="group">
                <button type="submit" class="btn btn-outline-primary mr-1">Satışı Tamamla</button>
            </div>
        </form>


    </div>
</div>

<jsp:include page="inc/js.jsp"></jsp:include>
<script src="js/boxAction.js"></script>
<script src="js/order.js"></script>
</body>

</html>