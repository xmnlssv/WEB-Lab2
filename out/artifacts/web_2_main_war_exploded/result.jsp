<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="web.service.PointService" %>
<%@ page import="web.model.Point" %>

<!DOCTYPE html>
<html lang="ru-RU">

<head>
  <meta charset="UTF-8">
  <link href="stylesheets/styles.css" rel="stylesheet">
  <title>Результаты проверки | Веб-программирование</title>
</head>

<body>
<header id="info">
  <h1>Лабораторная работа №2</h1>
  <h2>Авторы: Боринский Игорь Дмитривевич и Трофимов Владислав Дмитриевич, P3214</h2>
  <h2>Вариант: 2462</h2>
</header>

<table id="mainTable" class="shaded">
  <thead>
  <td colspan="5">
    <h3>Результаты проверки:</h3>
  </td>
  </thead>

  <tbody>
  <tr>
    <td colspan="5"><hr></td>
  </tr>
  </tbody>

  <tfoot>
  <tr>
    <td colspan="5" id="outputContainer">
      <% PointService pointService = (PointService) request.getSession().getAttribute("bean");
        if (pointService == null) {
      %>
      <h4>
        <span id="notifications" class="outputStub notification">Нет результатов</span>
      </h4>
      <table id="outputTable">
        <tr>
          <th>X</th>
          <th>Y</th>
          <th>R</th>
          <th>Результат</th>
        </tr>
      </table>
      <% } else { %>
      <table id='outputTable'>
        <tr>
          <th>X</th>
          <th>Y</th>
          <th>R</th>
          <th>Точка входит в ОДЗ</th>
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
  <tr>
    <td>
      <div id="goBack">
        <a href="index.jsp">Вернуться к форме</a>
      </div>
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

<script src="script.js"></script>
</body>

</html>
