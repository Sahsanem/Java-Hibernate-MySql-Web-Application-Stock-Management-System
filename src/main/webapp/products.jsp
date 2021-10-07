<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
    <title>Ürünler</title>
<jsp:include page="inc/css.jsp"></jsp:include>
</head>

<body>

<div class="wrapper d-flex align-items-stretch">
    <jsp:include page="inc/sideBar.jsp"></jsp:include>

    <!-- Page Content  -->
    <div id="content" class="p-4 p-md-5">

        <jsp:include page="inc/topMenu.jsp"></jsp:include>

        <h3 class="mb-3">
            Ürünler
            <small class="h6">Ürün Paneli</small>
        </h3>

        <div class="main-card mb-3 card mainCart">
            <div class="card-header cardHeader">Ürün Ekle</div>

            <form class="row p-3" id="product_add_form">
                <div class="col-md-3 mb-3">
                    <label for="p_title" class="form-label">Başlık</label>
                    <input type="text" name="p_title" id="p_title" class="form-control" />
                </div>
                <div class="col-md-3 mb-3">
                    <label for="a_price" class="form-label">Alış Fiyatı</label>
                    <input type="number" name="aprice" id="a_price" class="form-control" />
                </div>
                <div class="col-md-3 mb-3">
                    <label for="o_price" class="form-label">Satış Fiyatı</label>
                    <input type="number" name="oprice" id="o_price" class="form-control" />
                </div>
                <div class="col-md-3 mb-3">
                    <label for="p_code" class="form-label">Ürün Kodu</label>
                    <input type="number" name="p_code" id="p_code" class="form-control" />
                </div>


                <div class="col-md-3 mb-3">
                    <label for="p_tax" class="form-label">KDV</label>
                    <select class="form-select" name="p_tax" id="p_tax">
                        <option value="">Seçiniz</option>
                        <option value="1">%1</option>
                        <option value="2">%8</option>
                        <option value="3">%18</option>
                    </select>
                </div>

                <div class="col-md-3 mb-3">
                    <label for="p_section" class="form-label">Birim</label>
                    <select class="form-select" name="p_section" id="p_section">
                        <option value="-1">Seçiniz</option>
                        <option value="0">Adet</option>
                        <option value="1">KG</option>
                        <option value="2">Metre</option>
                        <option value="3">Paket</option>
                        <option value="4">Litre</option>
                    </select>
                </div>

                <div class="col-md-3 mb-3">
                    <label for="p_size" class="form-label">Miktar</label>
                    <input type="number" name="psize" id="p_size" class="form-control" />
                </div>

                <div class="col-md-3 mb-3">
                    <label for="p_detail" class="form-label">Ürün Detay</label>
                    <input type="text"  id="p_detail" class="form-control" />
                </div>


                <div class="btn-group col-md-3 " role="group">
                    <button type="submit" class="btn btn-outline-primary mr-1">Gönder</button>
                    <button type="reset" class="btn btn-outline-primary">Temizle</button>
                </div>
            </form>
        </div>


        <div class="main-card mb-3 card mainCart">
            <div class="card-header cardHeader">Ürün Listesi</div>

            <div class="table-responsive">
                <table class="align-middle mb-0 table table-borderless table-striped table-hover">
                    <thead>
                    <tr>
                        <th>Uid</th>
                        <th>Başlık</th>
                        <th>Alış Fiyatı</th>
                        <th>Satış Fiyatı</th>
                        <th>Kod</th>
                        <th>KDV</th>
                        <th>Birim</th>
                        <th>Miktar</th>
                        <th>Ürün Detay</th>
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







<div class="modal fade" id="ProductDetailModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" >
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: black" >Ürün Detayı</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row ">
                    <div class="col-md-3 mb-3">
                        <label  class="form-label">Başlık</label>
                        <div style="color: black" id="ptitle" class="form-text"></div>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label  class="form-label">Alış Fiyatı</label>
                        <div style="color: black" id="aprice" class="form-text"></div>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label  class="form-label">Satış Fiyatı</label>
                        <div style="color: black" id="oprice" class="form-text"></div>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label  class="form-label">Ürün Kodu</label>
                        <div style="color: black" id="pcode" class="form-text"></div>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label  class="form-label">KDV</label>
                        <div style="color: black"  id="ptax" class="form-text"></div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label  class="form-label">Miktar</label>
                        <h5 style="color: black "  id="psize" class="form-text"></h5>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label  class="form-label">Birim</label>
                        <h5 style="color: black "  id="psection" class="form-text"></h5>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label  class="form-label">Ürün Detay</label>
                        <div style="color: black"  name="pdetail" id="pdetail" class="form-text"></div>
                    </div>


                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Kapat</button>

            </div>
        </div>
    </div>
</div>

</div>
<div class="modal-footer">
    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Kapat</button>
</div>
</div>
</div>
</div>

<jsp:include page="inc/js.jsp"></jsp:include>
<script src="js/products.js"></script>

</body>

</html>