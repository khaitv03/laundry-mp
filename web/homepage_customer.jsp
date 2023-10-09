<%-- 
    Document   : homepage_customer
    Created on : Oct 8, 2023, 3:12:53 PM
    Author     : khait
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link rel="stylesheet" href="css/homepagecus.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <header class="header">
            <nav class="menu">
                <a href="updateacc.jsp">Profile</a>
                <a href="#">Order</a>
                <a href="#">Store</a>

            </nav>
            <section>
                <img class="logo"src="image/logo.png" alt="logo"/>
            </section>
            <nav class="logout">
                <a href="#">Log out</a>
            </nav>
        </header>

        <main>
            <div class="banner">
                <img src="image/banner.jpg" alt="banner">
            </div>

            <div class="search">
                <input class="search-text" type="text" placeholder="Tìm kiếm cửa hàng.." name="search"  value="" >
                <input class="search-btn" type="submit" value="Tìm kiếm" name="btAction" />
            </div>

            <section class="store">
                <ul>        
                    <li>
                        <a href="#">
                            <img class="store-img" src="image/tiem-giat-ui-1.jpg" alt="store1">
                            <h3 class="store-name">Tên Store</h3>
                            <p>65 tran nao, quan 2, thanh pho hcm</p>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <img class="store-img" src="image/tiem-giat-ui-1.jpg" alt="store2">
                            <h3 class="store-name">Tên Store</h3>
                            <p>địa chỉ cua hang</p>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <img class="store-img" src="image/tiem-giat-ui-1.jpg" alt="store3">
                            <h3 class="store-name">Tên Store</h3>
                            <p>địa chỉ cua hang</p>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <img class="store-img" src="image/tiem-giat-ui-1.jpg" alt="store4">
                            <h3 class="store-name">Tên Store</h3>
                            <p>địa chỉ cua hang</p>
                        </a>
                    </li>

                </ul>
            </section>

            <h2>Quy trình 4 bước đơn giản</h2>

            <section class="banner2">
                <ul>        
                    <li>
                        <img class="banner2-img" src="image/b2.jpg" alt="b1">
                        <h3>1</h3>
                        <p>Thu gom quần áo bẩn của bạn</p>
                    </li>

                    <li>
                        <img class="banner2-img" src="image/b4.jpg" alt="b2">
                        <h3>2</h3>
                        <p>Giao đến cửa hàng bạn chọn</p>
                    </li>

                    <li>
                        <img class="banner2-img" src="image/b3.jpg" alt="b3">
                        <h3>3</h3>
                        <p>Giặt và ủi quần áo của bạn</p>
                    </li>

                    <li>
                        <img class="banner2-img" src="image/b1.jpg" alt="b4">
                        <h3>4</h3>
                        <p>Giao quần áo đến tay bạn</p>
                    </li>

                </ul>
            </section>
        </main>



        <footer>
            <div class="footer">
                
                <div class="infor">
                    <h3>Email: khailadaica@gmail.com</h3>
                    <h3>Phone: 0916973969</h3>
                    <h3>Address: Ho Chi Minh city</h3>
                </div>

                <div class="footer-logo">
                    <h3>Best your partner</h3>
                    <img class="logo" src="image/logo.png" alt="logo"/>
                    <p>All Copyright reserved</p>
                </div>

                <div class="infor2">
                    <h3>24/7 Supports</h3>
                    <h3>High Quality</h3>
                </div>
                
            </div>

        </footer>
    </body>
</html>
