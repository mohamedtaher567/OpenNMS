<%--
/*******************************************************************************
 * This file is part of OpenNMS(R).
 *
 * Copyright (C) 2007-2012 The OpenNMS Group, Inc.
 * OpenNMS(R) is Copyright (C) 1999-2012 The OpenNMS Group, Inc.
 *
 * OpenNMS(R) is a registered trademark of The OpenNMS Group, Inc.
 *
 * OpenNMS(R) is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published
 * by the Free Software Foundation, either version 3 of the License,
 * or (at your option) any later version.
 *
 * OpenNMS(R) is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OpenNMS(R).  If not, see:
 *      http://www.gnu.org/licenses/
 *
 * For more information contact:
 *     OpenNMS(R) Licensing <license@opennms.org>
 *     http://www.opennms.org/
 *     http://www.opennms.com/
 *******************************************************************************/

--%>

<%@page language="java" contentType="text/html" session="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ec" uri="http://www.extremecomponents.org" %>

<jsp:include page="/includes/header.jsp" flush="false" >
  <jsp:param name="title" value="Statistics Reports List" />
  <jsp:param name="headTitle" value="Statistics Reports List" />
  <jsp:param name="location" value="reports" />
  <jsp:param name="breadcrumb" value="<a href='report/index.jsp'>Report</a>"/>
  <jsp:param name="breadcrumb" value="<a href='statisticsReports/index.htm'>Statistics Reports</a>"/>
  <jsp:param name="breadcrumb" value="List"/>
</jsp:include>

<c:choose>
  <c:when test="${empty model}">
    <h3>Report List</h3>
    <div class="boxWrapper">
      <p>
        None found.
      </p>
    </div>
  </c:when>

  <c:otherwise>
    <!-- We need the </script>, otherwise IE7 breaks -->
    <script type="text/javascript" src="js/extremecomponents.js"></script>
      
    <link rel="stylesheet" type="text/css" href="css/onms-extremecomponents.css"/>
        
    <form id="form" action="${relativeRequestPath}" method="post">
      <ec:table items="model" var="row"
        action="${relativeRequestPath}?${pageContext.request.queryString}"
        filterable="true"
        imagePath="images/table/compact/*.gif"
        title="Statistics Report List"
        tableId="reportList"
        form="form"
        rowsDisplayed="25"
        view="org.opennms.web.svclayer.etable.FixedRowCompact"
        showExports="true" showStatusBar="true" 
        autoIncludeParameters="false"
        >
      
        <ec:exportPdf fileName="Statistics Report List.pdf" tooltip="Export PDF"
          headerColor="black" headerBackgroundColor="#b6c2da"
          headerTitle="Statistics Report List" />
        <ec:exportXls fileName="Statistics Report List.xls" tooltip="Export Excel" />
      
        <ec:row highlightRow="false">
        <%--
          <ec:column property="name" interceptor="org.opennms.web.svclayer.outage.GroupColumnInterceptor"/>
          --%>

          <ec:column property="description" title="Enter Filter Text Above <br/> <br/> Report Description">
          	<c:url var="reportUrl" value="statisticsReports/report.htm">
          		<c:param name="id" value="${row.id}" />
          	</c:url>
          	<a href="${reportUrl}">${row.description}</a>
          </ec:column>

          <ec:column property="startDate" title="Enter Filter Text Above <br/> <br/> Reporting Period Start" cell="date" format="MMM d, yyyy  HH:mm:ss"/>
          <ec:column property="endDate" title="Enter Filter Text Above <br/> <br/> Reporting Period End"  cell="date" format="MMM d, yyyy  HH:mm:ss"/>
		  <ec:column property="duration" title="Enter Filter Text Above <br/> <br/> Run Interval">
            ${row.durationString}
          </ec:column>
          
          
        <%--
          <ec:column property="jobStartedDate" title="Enter Filter Text Above <br/> <br/> Job Started"  cell="date" format="MMM d, yyyy  HH:mm:ss"/>
          <ec:column property="jobCompletedDate" title="Enter Filter Text Above <br/> <br/> Job Completed"  cell="date" format="MMM d, yyyy  HH:mm:ss"/>
          <ec:column property="Enter Filter Text Above <br/> <br/> jobDuration" title="Job Run Time">
            ${row.jobDurationString}
          </ec:column>
        --%>

          <ec:column property="maxDatumValue" title="Enter Filter Text Above <br/> <br/> Max Value">
            ${row.maxDatumValue}
          </ec:column>
          <ec:column property="minDatumValue" title="Enter Filter Text Above <br/> <br/> Min Value">
            ${row.minDatumValue}
          </ec:column>

          <ec:column property="purgeDate" title="Enter Filter Text Above <br/> <br/> Keep Until At Least" cell="date" format="MMM d, yyyy  HH:mm:ss"/>
        </ec:row>
      </ec:table>
    </form>
  </c:otherwise>
</c:choose>


<jsp:include page="/includes/footer.jsp" flush="false"/>