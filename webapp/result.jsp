<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="web.daos.PointDao" %>
<%@ page import="web.models.Point" %>

<!DOCTYPE html>
<html lang="ru-RU">

<head>
  <meta charset="UTF-8">
  <link href="stylesheets/styles.css" rel="stylesheet">
  <title>Результаты проверки | Веб-программирование</title>
</head>

<body>
<header class="shaded animated" id="info">
  <h1>Веб-программирование, Лабораторная работа №2, Вариант 2462</h1>
  <div id="credit">
    <a href="https://github.com/xmnlssv/WEB-Lab2" class="illuminated animated" title="Перейти к GitHub репозиторию">
      Боринский Игорь Дмитривевич и Трофимов Владислав Дмитриевич, P3214
    </a>
  </div>
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
      <% PointDao dao = (PointDao) request.getSession().getAttribute("bean");
        if (dao == null) {
      %>
      <h4>
        <span id="notifications" class="outputStub notification">Нет результатов</span>
      </h4>
      <table id="outputTable">
        <tr>
          <th>X</th>
          <th>Y</th>
          <th>R</th>
          <th>Точка входит в ОДЗ</th>
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
        <% for (Point point : dao.getPoints()) { %>
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
