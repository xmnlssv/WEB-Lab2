<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="web.service.PointService" %>
<%@ page import="web.model.Point" %>

<!DOCTYPE html>
<html lang="ru-RU">

<head>
  <meta charset="UTF-8">
  <link href="stylesheets/styles.css" rel="stylesheet">
  <title>Лабораторная работа №2 | Веб-программирование</title>
</head>

<body>
<header id="info">
  <h1>Лабораторная работа №2</h1>
  <h2>Авторы: Боринский Игорь Дмитривевич и Трофимов Владислав Дмитриевич, P3214</h2>
  <h2>Вариант: 2462</h2>
</header>

<table id="mainTable" class="shaded">
  <thead>
  </thead>
  <tbody>

  <tr>
    <td rowspan="3">Выберите X:</td>
    <td><input name="X-button" class="illuminated animated" type="button" value="-3"></td>
    <td><input name="X-button" class="illuminated animated" type="button" value="-2"></td>
    <td><input name="X-button" class="illuminated animated" type="button" value="-1"></td>
    <td rowspan="6">
      <svg xmlns="http://www.w3.org/2000/svg" id="svg">
        <line x1="0" y1="150" x2="300" y2="150" stroke="#000720"></line>
        <line x1="150" y1="0" x2="150" y2="300" stroke="#000720"></line>
        <line x1="270" y1="148" x2="270" y2="152" stroke="#000720"></line>
        <text x="265" y="140">R</text>
        <line x1="210" y1="148" x2="210" y2="152" stroke="#000720"></line>
        <text x="200" y="140">R/2</text>
        <line x1="90" y1="148" x2="90" y2="152" stroke="#000720"></line>
        <text x="75" y="140">-R/2</text>
        <line x1="30" y1="148" x2="30" y2="152" stroke="#000720"></line>
        <text x="20" y="140">-R</text>
        <line x1="148" y1="30" x2="152" y2="30" stroke="#000720"></line>
        <text x="156" y="35">R</text>
        <line x1="148" y1="90" x2="152" y2="90" stroke="#000720"></line>
        <text x="156" y="95">R/2</text>
        <line x1="148" y1="210" x2="152" y2="210" stroke="#000720"></line>
        <text x="156" y="215">-R/2</text>
        <line x1="148" y1="270" x2="152" y2="270" stroke="#000720"></line>
        <text x="156" y="275">-R</text>

        <polygon points="300,150 295,155 295, 145" fill="#000720" stroke="#000720"></polygon>
        <polygon points="150,0 145,5 155,5" fill="#000720" stroke="#000720"></polygon>

<%--        square--%>
        <rect x="90" y="30" width="60" height="120" fill-opacity="0.4" stroke="navy" fill="#00FFFF"></rect>


        <polygon points="270,150 150,150 150,90" fill-opacity="0.4" stroke="navy" fill="#00FFFF"></polygon>

<%--        sector--%>
<%--        <path d="M 150 150 L 270 150 C 270 80 220 30 150 30 L Z" fill-opacity="0.4" stroke="navy" fill="blue" />--%>
        <path d="M 150 150 L 150 270 A 150 150 0 0 1 30 150 Z" fill-opacity="0.4" stroke="navy" fill="#00FFFF"/>


      </svg>
    </td>
  </tr>
  <tr>
    <td><input name="X-button" class="illuminated animated" type="button" value="0"></td>
    <td><input name="X-button" class="illuminated animated" type="button" value="1"></td>
    <td><input name="X-button" class="illuminated animated" type="button" value="2"></td>
  </tr>
  <tr>
    <td><input name="X-button" class="illuminated animated" type="button" value="3"></td>
    <td><input name="X-button" class="illuminated animated" type="button" value="4"></td>
    <td><input name="X-button" class="illuminated animated" type="button" value="5"></td>
  </tr>

  <tr>
    <td>Введите Y:</td>
    <td colspan="3"><input required name="Y-input" class="illuminated animated" type="text"
                           placeholder="-5..5" maxlength="6"
                           pattern="^-[0-5]|[0-5]" required></td>
  </tr>

  <tr>
    <td rowspan="2">Выберите R:</td>
    <td>1<input name="R-radio-group" class="illuminated animated" type="radio" value="1"></td>
    <td>2<input name="R-radio-group" class="illuminated animated" type="radio" value="2"></td>
    <td>3<input name="R-radio-group" class="illuminated animated" type="radio" value="3"></td>
  </tr>
  <tr>
    <td>4<input name="R-radio-group" class="illuminated animated" type="radio" value="4"></td>
    <td>5<input name="R-radio-group" class="illuminated animated" type="radio" value="5"></td>
  </tr>

  <tr>
    <td colspan="5">
      <button type="submit" id="checkButton">Отправить</button>
    </td>
  </tr>

  <tr>
    <td colspan="5">
      <hr>
    </td>
  </tr>
  </tbody>

  <tfoot>
  <tr>
    <td colspan="5" id="outputContainer">
      <% PointService pointService = (PointService) request.getSession().getAttribute("bean");
        if (pointService == null) {
      %>
      <table id="outputTable">
        <tr>
          <th>x</th>
          <th>y</th>
          <th>r</th>
          <th>Результат</th>
        </tr>
      </table>
      <% } else { %>
      <h4>
        <span class="notification"></span>
      </h4>
      <table id="outputTable">
        <tr>
          <th>x</th>
          <th>y</th>
          <th>r</th>
          <th>Результат</th>
        </tr>
        <% for (Point point : pointService.getPoints()) { %>
        <tr>
          <td>
            <%= point.getX() %>
          </td>
          <td>
            <%= point.getY() %>
          </td>
          <td>
            <%= point.getR() %>
          </td>
          <td>
            <%= point.isInArea() ? "<span class=\"success\">true</span>"
              : "<span class=\"fail\">false</span>" %>
          </td>
        </tr>
        <% } %>
      </table>
      <% } %>
    </td>
  </tr>
  </tfoot>

</table>

<footer>
  <figure>
    <img class="illuminated" src="images/logo_footer.png"
         alt="Факультет Программной инженерии и компьютерной техники">
    <figcaption>2023</figcaption>
  </figure>
</footer>

<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
<script src="script.js"></script>
</body>

</html>
