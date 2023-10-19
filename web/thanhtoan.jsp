<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page language="java" import="Model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Thanh toán</title>
        <link rel="stylesheet" href="css/thanhtoan.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6">
                    <!-- Khung bên trái -->
                    <div class="store-details">
                        <img id="storeImage" alt="Store Image" style="width: 100%; height: auto;">

                        <p>Store Name: <span><script>document.write(sessionStorage.getItem('catStoreName'));</script></span></p>
                        <p>Address: <span><script>document.write(sessionStorage.getItem('catAddress'));</script></span></p>

                        <script>
                            window.onload = function () {
                                var storeImage = document.getElementById("storeImage");
                                var catImage = sessionStorage.getItem('catImage');

                                if (catImage) {
                                    storeImage.src = catImage;
                                }
                            };

                        </script>





                        <div class="rating">
                            <p>Rating:
                                <script>
                                    var ratingStr = sessionStorage.getItem('catRating');
                                    if (ratingStr != null && ratingStr.match(/^\d+$/)) {
                                        var rating = parseInt(ratingStr);
                                        for (var i = 0; i < rating; i++) {
                                            document.write('<span class="star">★</span>');
                                        }
                                    } else {
                                        document.write('Invalid rating value');
                                    }
                                </script>
                            </p>
                        </div>
                    </div>
                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success">
                            <strong>Thông báo:</strong> <c:out value="${successMessage}" />
                        </div>
                    </c:if>
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">
                            <strong>Lỗi:</strong> <c:out value="${errorMessage}" />
                        </div>
                    </c:if>

                </div>
                <div class="col-md-6">
                    <!-- Khung bên phải -->
                    <div class="customer-details">
                        <h2>Thông tin khách hàng</h2>
                        <form action="MainController" method="post">
                            <label for="fullname">Tên khách hàng:</label>
                            <input type="text" class="bg-light form-control" name="fullname" value="${user.fullname}" >
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger">
                                    <strong>Lỗi:</strong> <c:out value="${errorMessage}" />
                                </div>
                            </c:if>
                            <label for="phone">Số điện thoại:</label>
                            <input type="tel" id="phone" name="phone" value="${user.phone}" required><br>
                            <c:if test="${not empty errorMessage3}">
                                <div class="alert alert-danger">
                                    <strong>Lỗi:</strong> <c:out value="${errorMessage3}" />
                                </div>
                            </c:if>
                            <label for="customerAddress">Địa chỉ:</label>
                            <input type="text" id="customerAddress" name="customerAddress" value="${user.address}" required><br>
                            <label for="kilos">Số kg:</label>
                            <input type="number" id="kilos" name="kilos" required><br>
                            <label for="services">Dịch vụ:</label>
                            <select id="services" name="services" required>
                                <script>
                                    document.write('<option value="1" data-price="' + sessionStorage.getItem('catPriceGiatThuong') + '">Giặt thường: ' + sessionStorage.getItem('catPriceGiatThuong') + ' vnđ</option>');
                                    document.write('<option value="2" data-price="' + sessionStorage.getItem('catPriceGiatNhanh') + '">Giặt nhanh: ' + sessionStorage.getItem('catPriceGiatNhanh') + ' vnđ</option>');
                                    document.write('<option value="3" data-price="' + sessionStorage.getItem('catPriceGiatSieuToc') + '">Giặt siêu tốc: ' + sessionStorage.getItem('catPriceGiatSieuToc') + ' vnđ</option>');
                                </script>
                            </select>

                            <label for="note">Ghi chú:</label>
                            <textarea id="note" name="note" rows="4"></textarea><br>
                            <label for="session">Buổi:</label>
                            <select id="session" name="session" required>
                                <option value="morning">Buổi sáng</option>
                                <option value="noon">Buổi trưa</option>
                                <option value="afternoon">Buổi chiều</option>
                                <option value="evening">Buổi tối</option>
                            </select><br>


                            <input type="hidden" name="storeID" id="storeIDField">
                            <input type="hidden" name="catAddress" id="catAddressField">

                            <script>
                                document.addEventListener("DOMContentLoaded", function () {
                                    var storeID = sessionStorage.getItem('catStoreID');
                                    var catAddress = sessionStorage.getItem('catAddress');

                                    console.log("storeID: " + storeID);
                                    console.log("catAddress: " + catAddress);

                                    document.getElementById('storeIDField').value = storeID;
                                    document.getElementById('catAddressField').value = catAddress;
                                });

                            </script>




                            <input type="hidden" name="totalPrice" id="totalPrice" value="0" />
                            <p>Tổng thanh toán: <span id="totalAmount">0 vnđ</span></p>
                            <br>
                            <button type="submit" name="btAction" value="ConfirmOrder">Xác nhận đặt hàng</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function calculateTotalAmount() {
                var selectedService = document.getElementById("services");
                var selectedOption = selectedService.options[selectedService.selectedIndex];
                var price = selectedOption.getAttribute("data-price");
                var kilos = parseInt(document.getElementById("kilos").value);
                if (isNaN(kilos) || kilos <= 0) {
                    document.getElementById("totalAmount").textContent = "0 vnđ";
                    return;
                }
                var totalAmount = price * kilos;
                document.getElementById("totalAmount").textContent = totalAmount + " vnđ";
                document.getElementById("totalPrice").value = totalAmount;
            }
            document.getElementById("services").addEventListener("change", calculateTotalAmount);
            document.getElementById("kilos").addEventListener("input", calculateTotalAmount);
            calculateTotalAmount();
        </script>
    </body>
</html>