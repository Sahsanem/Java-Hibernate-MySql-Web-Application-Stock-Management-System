<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<!doctype html>
<html lang="en">

<head>
    <title>Kasa</title>
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
            <small class="h6">Kasa Hareketleri</small>
        </h3>

        <div class="row">

            <div class="col-sm-4 mb-3">
                <div class="card cardBackground1" id="card1">
                    <div class="card-body">
                        <div style="display: flex; justify-content: space-between;">
                            <h5 style="align-self: center;">Toplam Kasaya Giren</h5>
                            <h4><strong> 5576₺ </strong></h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 mb-3">
                <div class="card cardBackground2" id="card2">
                    <div class="card-body">
                        <div style="display: flex; justify-content: space-between;">
                            <h5 style="align-self: center;">Toplam Kasadan Çıkan</h5>
                            <h4><strong> 2000₺ </strong></h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-4 mb-3">
                <div class="card cardBackground3" id="card3">
                    <div class="card-body">
                        <div style="display: flex; justify-content: space-between;">
                            <h5 style="align-self: center;"> Kasada Kalan</h5>
                            <h4><strong> 3576₺ </strong></h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-4 mb-3">
                <div class="card cardBackground4" id="card4">
                    <div class="card-body">
                        <div style="display: flex; justify-content: space-between;">
                            <h5 style="align-self: center;"> Bugün Kasaya Giriş</h5>
                            <h4><strong> 176₺ </strong></h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-4 mb-3">
                <div class="card cardBackground4" id="card5">
                    <div class="card-body">
                        <div style="display: flex; justify-content: space-between;">
                            <h5 style="align-self: center;"> Bugün Kasadan Çıkan</h5>
                            <h4><strong> 66₺ </strong></h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-4 mb-3">
                <a href="payIn.jsp">
                    <div class="card cardBackground4" id="card6">
                        <div class="card-body">
                            <div style="display: flex; justify-content: space-between;">
                                <h5 style="align-self: center;"> Kasa Yönetimi</h5>
                                <i class="fas fa-link fa-2x" style="color: white; align-self: center;"></i>
                            </div>
                        </div>
                    </div>
                </a>
            </div>

        </div>

        <div class="main-card mb-3 card mainCart">
            <div class="card-header cardHeader">Arama / Rapor</div>

            <form class="row p-3"id="check_out_form_add">

                <div class="col-md-3 mb-3">
                    <label for="cname" class="form-label">Müşteri Seçiniz</label>
                    <select id="cname" class="selectpicker" data-width="100%" data-show-subtext="true" data-live-search="true" required>
                        <option data-subtext="">Seçim Yapınız</option>
                        <c:if test="${dbUtil.allCustomerList().size()>0}">
                            <c:forEach items="${dbUtil.allCustomerList()}" var="item">
                                <option value="${item.cu_id}" data-subtext="${item.cu_code}">${item.cu_name}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="ctype" class="form-label">Tür</label>
                    <select class="form-select" name="ctype" id="ctype">
                        <option value="0" >Tümü</option>
                        <option value="1">Giriş</option>
                        <option value="2">Çıkış</option>
                    </select>
                </div>

                <div class="col-md-3 mb-3">
                    <label for="startDate" class="form-label">Başlama Tarihi</label>
                    <input type="date" name="startDate" id="startDate" class="form-control" />
                </div>

                <div class="col-md-3 mb-3">
                    <label for="endDate" class="form-label">Bitiş Tarihi</label>
                    <input type="date" name="endDate" id="endDate" class="form-control" />
                </div>

                <div class="col-md-3">
                    <button type="submit" class="col btn btn-outline-primary">Gönder</button>
                </div>
            </form>
        </div>

        <div class="main-card mb-3 card mainCart">
            <div class="card-header cardHeader">Arama Sonuçları</div>
            <div class="table-responsive">
                <table class="align-middle mb-0 table table-borderless table-striped table-hover">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Adı</th>
                        <th>Soyadı</th>
                        <th>Ünvan</th>
                        <th>Kod</th>
                        <th>Türü</th>
                        <th>Telefon</th>
                        <th>Mail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- for loop  -->
                    <tr role="row" class="odd">
                        <td>84</td>
                        <td>011</td>
                        <td>Su</td>
                        <td>120</td>
                        <td>84</td>
                        <td>011</td>
                        <td>Su</td>
                        <td>120</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>


    </div>
</div>
</div>

<jsp:include page="inc/js.jsp"></jsp:include>
</body>

</html>