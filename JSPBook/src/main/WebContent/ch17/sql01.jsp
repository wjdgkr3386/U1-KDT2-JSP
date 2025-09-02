<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<title>JSTL</title>
</head>
<body>
	<sql:setDataSource var="ds"
		url="jdbc:mysql://localhost:3306/webmarketdb"
		driver="com.mysql.cj.jdbc.Driver" user="root" password="1234" />

	<sql:query var="rs" dataSource="${ds}">
		select * from member9
	</sql:query>

	<table border="1">
		<tr>
			<c:forEach var="columnName" items="${rs.columnNames}">
				<th width="100"><c:out value="${columnName}" /></th>
			</c:forEach>
		</tr>
		<c:forEach var="row" items="${rs.rowsByIndex}">
		<tr>
			<c:forEach var="column" items="${row}" varStatus="i">
			<td>
				<c:if test="${column != null}">
					<c:out value="${column}" />
				</c:if> 
				<c:if test="${column == null}">
					&nbsp;
				</c:if>
			</td>
			</c:forEach>
		</tr>
		</c:forEach>
	</table>
</body>
</html>