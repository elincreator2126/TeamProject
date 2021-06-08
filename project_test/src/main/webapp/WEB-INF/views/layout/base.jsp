<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>


        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="EUC-KR">
            <title>Insert title here</title>
            <!-- Bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
            <!-- FontAwesome -->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
        </head>
        <style>
            .indent {
                margin: 20em;
            }
        </style>

        <body>

            <tiles:insertAttribute name="header" />
            <div class="indent"></div>
            <div>���� ��ġ�� ������� �ٸ� �۾��� ���ص��� �ʵ��� ��� �����Դϴ�.</div>
            <tiles:insertAttribute name="body" />
            <!-- <meta http-equiv="refresh" content="0; url=/" /> -->
            <tiles:insertAttribute name="footer" />
        </body>

        </html>