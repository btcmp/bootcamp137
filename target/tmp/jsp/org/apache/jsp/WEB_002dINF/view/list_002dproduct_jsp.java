/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: jetty/9.4.6.v20170531
 * Generated at: 2018-05-29 03:18:40 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class list_002dproduct_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/C:/Users/Yosua%20Ardi%20Kun/.m2/repository/org/apache/taglibs/taglibs-standard-impl/1.2.5/taglibs-standard-impl-1.2.5.jar!/META-INF/c.tld", Long.valueOf(1426003870000L));
    _jspx_dependants.put("file:/C:/Users/Yosua%20Ardi%20Kun/.m2/repository/org/apache/taglibs/taglibs-standard-impl/1.2.5/taglibs-standard-impl-1.2.5.jar", Long.valueOf(1525363982000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css\" integrity=\"sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB\" crossorigin=\"anonymous\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.0.13/css/all.css\" integrity=\"sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp\" crossorigin=\"anonymous\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.3.1.min.js\"></script>\r\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("<title>P.R.O.D.U.C.T</title>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t$(document).ready(function(){\r\n");
      out.write("\t\t$('#btn-add').on('click', function(){\r\n");
      out.write("\t\t\t$('#modalAdd').modal();\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$('#save').on('click', function(){\r\n");
      out.write("\t\t\tvar product = {\r\n");
      out.write("\t\t\t\t\tcode : $('#cde').val(),\r\n");
      out.write("\t\t\t\t\tname : $('#nme').val(),\r\n");
      out.write("\t\t\t\t\tdescription : $('#des').val()\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tconsole.log(product);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\turl: '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/product/save',\r\n");
      out.write("\t\t\t\ttype: 'POST',\r\n");
      out.write("\t\t\t\tcontentType : 'application/json',\r\n");
      out.write("\t\t\t\tdata : JSON.stringify(product),\r\n");
      out.write("\t\t\t\tsuccess : function(data){\r\n");
      out.write("\t\t\t\t\t$('.alert').alert()\r\n");
      out.write("\t\t\t\t\twindow.location = '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/product'\r\n");
      out.write("\t\t\t\t},\r\n");
      out.write("\t\t\t\terror : function(){\r\n");
      out.write("\t\t\t\t\talert('Error Update');\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar deleteid;\r\n");
      out.write("\t\t$('.delete').on('click', function(){\r\n");
      out.write("\t\t\tdeleteid = $(this).attr('id');\r\n");
      out.write("\t\t\t$('#modalDelete').modal();\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$('#btn-delete-yes').on('click', function(){\r\n");
      out.write("\t\t\t//console.log(deleteid);\r\n");
      out.write("\t\t\t//window.location='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/product/delete/'+deleteid;\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$('.edit').on('click', function(){\r\n");
      out.write("\t\t\tvar id = $(this).attr('id');\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\turl : '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/product/getproduct?id='+id,\r\n");
      out.write("\t\t\t\ttype : 'GET',\r\n");
      out.write("\t\t\t\tsuccess : function(object){\r\n");
      out.write("\t\t\t\t\t$('#id').val(object.id);\r\n");
      out.write("\t\t\t\t\t$('#editcode').val(object.code);\r\n");
      out.write("\t\t\t\t\t$('#editname').val(object.name);\r\n");
      out.write("\t\t\t\t\t$('#editdescription').val(object.description);\r\n");
      out.write("\t\t\t\t\tconsole.log(object);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\t$('#modalEdit').modal();\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$('#editsave').on('click', function(){\r\n");
      out.write("\t\t\tvar product = {\r\n");
      out.write("\t\t\t\tid : $('#id').val(),\r\n");
      out.write("\t\t\t\tcode : $('#editcode').val(),\r\n");
      out.write("\t\t\t\tname : $('#editname').val(),\r\n");
      out.write("\t\t\t\tdescription : $('#editdescription').val(),\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tconsole.log(product);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\turl : '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/product/edit',\r\n");
      out.write("\t\t\t\ttype : 'POST',\r\n");
      out.write("\t\t\t\tcontentType : 'application/json',\r\n");
      out.write("\t\t\t\tdata : JSON.stringify(product),\r\n");
      out.write("\t\t\t\tsuccess : function(data){\r\n");
      out.write("\t\t\t\t\talert('update oke');\r\n");
      out.write("\t\t\t\t\tconsole.log(data);\r\n");
      out.write("\t\t\t\t\twindow.location = '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/product'\r\n");
      out.write("\t\t\t\t},\r\n");
      out.write("\t\t\t\terror : function(){\r\n");
      out.write("\t\t\t\t\talert('Error Update');\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$('.view').on('click', function(){\r\n");
      out.write("\t\t\tvar id = $(this).attr('id');\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\turl : '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/product/getproduct?id='+id,\r\n");
      out.write("\t\t\t\ttype : 'GET',\r\n");
      out.write("\t\t\t\tsuccess : function(object){\r\n");
      out.write("\t\t\t\t\t$('#viewcode').val(object.code);\r\n");
      out.write("\t\t\t\t\t$('#viewname').val(object.name);\r\n");
      out.write("\t\t\t\t\t$('#viewdescription').val(object.description);\r\n");
      out.write("\t\t\t\t\tconsole.log(object);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\t$('#modalView').modal();\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$('#btn-search').on('click', function(){\r\n");
      out.write("\t\t\tvar form = $(\"#form-search\");\r\n");
      out.write("\t\t\tvar data = form.serialize();\r\n");
      out.write("\t\t\tconsole.log(data);\r\n");
      out.write("\t\t\twindow.location = '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/product/search?'+data;\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("/* *{\r\n");
      out.write("\tpadding:5px;\r\n");
      out.write("} */\r\n");
      out.write("\t#container{\r\n");
      out.write("\t\t/* border-radius:10px; */\r\n");
      out.write("\t\tpadding:0px;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\t#header{\r\n");
      out.write("\t\t\tbackground-color:#0069D9;\r\n");
      out.write("\t\t\tmargin-bottom:10px;\r\n");
      out.write("\t\t\theight:40px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t#header h5{\r\n");
      out.write("\t\tfont-family:'Helvetica Neue', Helvetica, Arial, sans-serif;\r\n");
      out.write("\t\tpadding-top:8px;\r\n");
      out.write("\t\tpadding-left:8px;\r\n");
      out.write("\t\tcolor:white;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t#body{\r\n");
      out.write("\t\t\twidth:96%;\r\n");
      out.write("\t\t\tcolor:white;\r\n");
      out.write("\t\t\tbackground-color:white;\r\n");
      out.write("\t\t\tmargin:auto;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t#body1{\r\n");
      out.write("\t\t\tmargin:auto;\r\n");
      out.write("\t\t\tmargin-bottom:20px;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t#btn-add{\r\n");
      out.write("\t\t\tfloat:right;\r\n");
      out.write("\t\t\twidth:70px;\r\n");
      out.write("\t\t\tmargin-right:5px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t#btn-search{\r\n");
      out.write("\t\t\twidth:70px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\r\n");
      out.write("\ttable{\r\n");
      out.write("\t\tcounter-reset:tableCount;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.counterCell:before{\r\n");
      out.write("\t\tcontent: counter(tableCount);\r\n");
      out.write("\t\tcounter-increment: tableCount;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\t  <div id=\"container\">\r\n");
      out.write("\t\t<div id=\"header\">\r\n");
      out.write("\t\t\t<h5>LIST PRODUCT<h5>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div id=\"body\">\r\n");
      out.write("\t\t  <div id=\"body1\">\r\n");
      out.write("\t\t\t<ol class=\"breadcrumb\">\r\n");
      out.write("\t\t\t  <li><a href=\"#\">Home </a>/</li>\r\n");
      out.write("\t\t\t  <li><a href=\"#\">Master </a>/</li>\r\n");
      out.write("\t\t\t  <li><a href=\"#\">List Souvenir Stock</a></li>\r\n");
      out.write("\t\t\t</ol>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<a href=\"#\" class=\"btn btn-sm btn-primary\" id=\"btn-add\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">Add</a><br><br>\r\n");
      out.write("\t\t  <form id=\"form-search\">\r\n");
      out.write("\t\t\t<div class=\"form-row\">\r\n");
      out.write("\t\t\t\t<div class=\"col-auto\">\r\n");
      out.write("\t\t\t\t  <input type=text name=\"code\" id=\"Product_Code\" class=\"form-control\" placeholder=\"Product Code\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"col-auto\">\r\n");
      out.write("\t\t\t\t  <input type=text name=\"name\" id=\"Product_Name\" class=\"form-control\" placeholder=\"Product Name\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"col-auto\">\r\n");
      out.write("\t\t\t\t  <input type=text name=\"description\" id=\"Description\" class=\"form-control\" placeholder=\"Description\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"col\">\r\n");
      out.write("\t\t\t\t  <input type=date name=\"createdDate\" id=\"Date_Created\" class=\"form-control\" placeholder=\"Date_Created\" onfocus=\"(this.type='date')\" onblur=\"(this.type='text')\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"col-auto\">\r\n");
      out.write("\t\t\t\t  <input type=text name=\"createdBy\" id=\"Created_By\" class=\"form-control\" placeholder=\"Created_By\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"col-auto\">\r\n");
      out.write("\t\t\t\t  <a href=\"#\" class=\"btn btn-sm btn-warning\" id=\"btn-search\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\">Search</a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t  </div>\r\n");
      out.write("\t\t  <div id=\"body2\">\r\n");
      out.write("\t\t\t  <table class=\"table\">\r\n");
      out.write("\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t  <tr>\r\n");
      out.write("\t\t\t\t\t<th>No</th>\r\n");
      out.write("\t\t\t\t\t<th>Product Code</th>\r\n");
      out.write("\t\t\t\t\t<th>Product Name</th>\r\n");
      out.write("\t\t\t\t\t<th>Description</th>\r\n");
      out.write("\t\t\t\t\t<th>Created Date</th>\r\n");
      out.write("\t\t\t\t\t<th>Created By</th>\r\n");
      out.write("\t\t\t\t\t<th>Action</th>\r\n");
      out.write("\t\t\t\t  </tr>\r\n");
      out.write("\t\t\t\t</thead>\r\n");
      out.write("\t\t\t   ");
      if (_jspx_meth_c_005fforEach_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t  \t</table>\r\n");
      out.write("\t\t  </div>\t\t\t\t\t\r\n");
      out.write("\t\t</div>\t\t\t\t\t\r\n");
      out.write("\t  </div>\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- /////////////////////////////////// Modal Add \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->\r\n");
      out.write("\t<div class=\"modal fade\" id=\"modalAdd\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">\r\n");
      out.write("\t  <div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\r\n");
      out.write("\t    <div class=\"modal-content\">\r\n");
      out.write("\t      <div class=\"modal-header\">\r\n");
      out.write("\t        <h5 class=\"modal-title\" id=\"exampleModalLongTitle\">Add Product</h5>\r\n");
      out.write("\t        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\r\n");
      out.write("\t          <span aria-hidden=\"true\">&times;</span>\r\n");
      out.write("\t        </button>\r\n");
      out.write("\t      </div>\r\n");
      out.write("\t      <div class=\"modal-body\">\r\n");
      out.write("\t        <div id=\"add-container\">\r\n");
      out.write("\t        \t<div class=\"row\">\r\n");
      out.write("\t\t      \t\t<div class=\"col-sm-4\" style=\"text-align:right;\">\r\n");
      out.write("\t\t      \t\t\t<p>*Product Code</p>\r\n");
      out.write("\t\t      \t\t</div>\r\n");
      out.write("\t\t      \t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t\t      \t\t\t<input type=\"text\" name=\"code\" placeholder=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${hasil}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${hasil}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" class=\"form-control\" id=\"cde\" disabled>\r\n");
      out.write("\t\t      \t\t</div>\r\n");
      out.write("\t\t      \t</div>\r\n");
      out.write("\t\t      \t\r\n");
      out.write("\t\t      \t<div class=\"row\">\r\n");
      out.write("\t\t      \t\t<div class=\"col-sm-4\" style=\"text-align:right;\">\r\n");
      out.write("\t\t      \t\t\t<p>*Product Name</p>\r\n");
      out.write("\t\t      \t\t</div>\r\n");
      out.write("\t\t      \t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t\t      \t\t\t<input type=\"text\" name=\"name\" placeholder=\"Type Product Name\" class=\"form-control\" id=\"nme\">\r\n");
      out.write("\t\t      \t\t</div>\r\n");
      out.write("\t\t      \t</div>\r\n");
      out.write("\t\t      \t\r\n");
      out.write("\t\t      \t<div class=\"row\">\r\n");
      out.write("\t\t      \t\t<div class=\"col-sm-4\" style=\"text-align:right;\">\r\n");
      out.write("\t\t      \t\t\t<p>Description</p>\r\n");
      out.write("\t\t      \t\t</div>\r\n");
      out.write("\t\t      \t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t\t      \t\t\t<input type=\"text\" name=\"description\" placeholder=\"Type Description\" class=\"form-control\" id=\"des\">\r\n");
      out.write("\t\t      \t\t</div>\r\n");
      out.write("\t\t      \t</div>\r\n");
      out.write("\t\t      \t\r\n");
      out.write("\t        </div>\r\n");
      out.write("\t        \r\n");
      out.write("\t      </div>\r\n");
      out.write("\t      \t<div class=\"modal-footer\">\r\n");
      out.write("\t\t        <button type=\"button\" class=\"btn btn-primary\" id=\"save\">Save</button>\r\n");
      out.write("\t\t        <button type=\"button\" class=\"btn btn-warning\" data-dismiss=\"modal\">Cancel</button>\r\n");
      out.write("\t\t    </div>\r\n");
      out.write("\t    </div>\r\n");
      out.write("\t  </div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<!--/////////////////////////////// Alert Save \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->\r\n");
      out.write("\t<div class=\"alert alert-success\" aria-hidden=\"true\">\r\n");
      out.write("\t  <strong>Success!</strong> This alert box could indicate a successful or positive action.\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t<!--/////////////////////////////// Modal Delete \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->\r\n");
      out.write("\t<div class=\"modal fade\" id=\"modalDelete\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">\r\n");
      out.write("\t  <div class=\"modal-dialog modal-dialog-centered\" role=\"document\" style=\"width:250px;\">\r\n");
      out.write("\t    <div class=\"modal-content\">\r\n");
      out.write("\t      <div class=\"modal-header\">\r\n");
      out.write("\t        <h5 class=\"modal-title\" id=\"exampleModalLongTitle\">Are You Sure?</h5>\r\n");
      out.write("\t        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\r\n");
      out.write("\t          <span aria-hidden=\"true\">&times;</span>\r\n");
      out.write("\t        </button>\r\n");
      out.write("\t      </div>\r\n");
      out.write("\t      <div class=\"modal-body\" style=\"margin:auto;\">\r\n");
      out.write("\t        <button type=\"button\" class=\"btn btn-warning\" id=\"btn-delete-yes\">Yes</button>\r\n");
      out.write("\t        <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\">No</button>\r\n");
      out.write("\t      </div>\r\n");
      out.write("\t    </div>\r\n");
      out.write("\t  </div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<!-- /////////////////////////////////// Modal Edit \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->\r\n");
      out.write("\t<div class=\"modal fade\" id=\"modalEdit\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">\r\n");
      out.write("\t  <div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\r\n");
      out.write("\t    <div class=\"modal-content\">\r\n");
      out.write("\t      <div class=\"modal-header\">\r\n");
      out.write("\t        <h5 class=\"modal-title\" id=\"exampleModalLongTitle\">Add Product</h5>\r\n");
      out.write("\t        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\r\n");
      out.write("\t          <span aria-hidden=\"true\">&times;</span>\r\n");
      out.write("\t        </button>\r\n");
      out.write("\t      </div>\r\n");
      out.write("\t      <div class=\"modal-body\">\r\n");
      out.write("\t        <div id=\"add-container\">\r\n");
      out.write("\t        \t<input type=\"hidden\" id=\"id\">\r\n");
      out.write("\t        \t<div class=\"row\">\r\n");
      out.write("\t        \t\t<div class=\"col-sm-4\" style=\"text-align:right;\">\r\n");
      out.write("\t        \t\t\t<p>*Product Code</p>\r\n");
      out.write("\t        \t\t</div>\r\n");
      out.write("\t        \t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t        \t\t\t<input type=\"text\" name=\"code\" placeholder=\"Auto Generate\" class=\"form-control\" id=\"editcode\" disabled>\r\n");
      out.write("\t        \t\t</div>\r\n");
      out.write("\t        \t</div>\r\n");
      out.write("\t        \t\r\n");
      out.write("\t        \t<div class=\"row\">\r\n");
      out.write("\t        \t\t<div class=\"col-sm-4\" style=\"text-align:right;\">\r\n");
      out.write("\t        \t\t\t<p>*Product Name</p>\r\n");
      out.write("\t        \t\t</div>\r\n");
      out.write("\t        \t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t        \t\t\t<input type=\"text\" name=\"name\" placeholder=\"Type Product Name\" class=\"form-control\" id=\"editname\">\r\n");
      out.write("\t        \t\t</div>\r\n");
      out.write("\t        \t</div>\r\n");
      out.write("\t        \t\r\n");
      out.write("\t        \t<div class=\"row\">\r\n");
      out.write("\t        \t\t<div class=\"col-sm-4\" style=\"text-align:right;\">\r\n");
      out.write("\t        \t\t\t<p>Description</p>\r\n");
      out.write("\t        \t\t</div>\r\n");
      out.write("\t        \t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t        \t\t\t<input type=\"text\" name=\"description\" placeholder=\"Type Description\" class=\"form-control\" id=\"editdescription\">\r\n");
      out.write("\t        \t\t</div>\r\n");
      out.write("\t        \t</div>\r\n");
      out.write("\t        </div>\r\n");
      out.write("\t      </div>\r\n");
      out.write("\t      \t<div class=\"modal-footer\">\r\n");
      out.write("\t\t        <button type=\"button\" class=\"btn btn-primary\" id=\"editsave\">Save</button>\r\n");
      out.write("\t\t        <button type=\"button\" class=\"btn btn-warning\" data-dismiss=\"modal\">Cancel</button>\r\n");
      out.write("\t\t    </div>\r\n");
      out.write("\t    </div>\r\n");
      out.write("\t  </div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- /////////////////////////////////// Modal View \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->\r\n");
      out.write("\t<div class=\"modal fade\" id=\"modalView\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">\r\n");
      out.write("\t  <div class=\"modal-dialog modal-dialog-centered\" role=\"document\">\r\n");
      out.write("\t    <div class=\"modal-content\">\r\n");
      out.write("\t      <div class=\"modal-header\">\r\n");
      out.write("\t        <h5 class=\"modal-title\" id=\"exampleModalLongTitle\">Add Product</h5>\r\n");
      out.write("\t        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\r\n");
      out.write("\t          <span aria-hidden=\"true\">&times;</span>\r\n");
      out.write("\t        </button>\r\n");
      out.write("\t      </div>\r\n");
      out.write("\t      <div class=\"modal-body\">\r\n");
      out.write("\t        <div id=\"add-container\">\r\n");
      out.write("\t        \t<div class=\"row\">\r\n");
      out.write("\t        \t\t<div class=\"col-sm-4\" style=\"text-align:right;\">\r\n");
      out.write("\t        \t\t\t<p>*Product Code</p>\r\n");
      out.write("\t        \t\t</div>\r\n");
      out.write("\t        \t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t        \t\t\t<input type=\"text\" name=\"code\" placeholder=\"Auto Generate\" class=\"form-control\" id=\"viewcode\" disabled >\r\n");
      out.write("\t        \t\t</div>\r\n");
      out.write("\t        \t</div>\r\n");
      out.write("\t        \t<div class=\"row\">\r\n");
      out.write("\t        \t\t<div class=\"col-sm-4\" style=\"text-align:right;\">\r\n");
      out.write("\t        \t\t\t<p>*Product Name</p>\r\n");
      out.write("\t        \t\t</div>\r\n");
      out.write("\t        \t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t        \t\t\t<input type=\"text\" name=\"name\" placeholder=\"Type Product Name\" class=\"form-control\" id=\"viewname\" disabled>\r\n");
      out.write("\t        \t\t</div>\r\n");
      out.write("\t        \t</div>\r\n");
      out.write("\t        \t<div class=\"row\">\r\n");
      out.write("\t        \t\t<div class=\"col-sm-4\" style=\"text-align:right;\">\r\n");
      out.write("\t        \t\t\t<p>Description</p>\r\n");
      out.write("\t        \t\t</div>\r\n");
      out.write("\t        \t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t        \t\t\t<input type=\"text\" name=\"description\" placeholder=\"Type Description\" class=\"form-control\" id=\"viewdescription\" disabled>\r\n");
      out.write("\t        \t\t</div>\r\n");
      out.write("\t        \t</div>\t\t\r\n");
      out.write("\t        </div>\r\n");
      out.write("\t       \t\r\n");
      out.write("\t     </div>\r\n");
      out.write("\t     \t<div class=\"modal-footer\">\r\n");
      out.write("\t\t       <button type=\"button\" class=\"btn btn-warning\" id=\"close\" data-dismiss=\"modal\">Close</button>\r\n");
      out.write("\t\t \t</div>\r\n");
      out.write("\t    </div>\r\n");
      out.write("\t   </div>\r\n");
      out.write("\t  </div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fforEach_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    try {
      _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fforEach_005f0.setParent(null);
      // /WEB-INF/view/list-product.jsp(229,6) name = items type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setItems(new org.apache.jasper.el.JspValueExpression("/WEB-INF/view/list-product.jsp(229,6) '${listDll}'",_jsp_getExpressionFactory().createValueExpression(_jspx_page_context.getELContext(),"${listDll}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
      // /WEB-INF/view/list-product.jsp(229,6) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setVar("product");
      int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
      try {
        int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
        if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\r\n");
            out.write("\t\t\t    <tbody>\r\n");
            out.write("\t\t\t\t  <tr>\r\n");
            out.write("\t\t\t\t    <td class=\"counterCell\"></td>\r\n");
            out.write("\t\t\t\t    <td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.code}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</td>\r\n");
            out.write("\t\t\t\t    <td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</td>\r\n");
            out.write("\t\t\t\t    <td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.description}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</td>\r\n");
            out.write("\t\t\t\t    <td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.createdDate}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</td>\r\n");
            out.write("\t\t\t\t    <td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.createdBy}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</td>\r\n");
            out.write("\t\t\t\t    <td>\r\n");
            out.write("\t\t\t\t\t  <a href=\"#\" class=\"delete\" id=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("\" style=\"color:inherit;\"><i class=\"fas fa-trash\"></i></a>\r\n");
            out.write("\t\t\t\t\t  <a href=\"#\" class=\"edit\" id=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("\" style=\"color:inherit;\"><i class=\"fas fa-pencil-alt\"></i></a>\r\n");
            out.write("\t\t\t\t\t  <a href=\"#\" class=\"view\" id=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${product.id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("\" style=\"color:inherit;\"><i class=\"fas fa-search\"></i></a></td>\r\n");
            out.write("\t\t\t\t  </tr>\r\n");
            out.write("\t\t\t    </tbody>\r\n");
            out.write("\t\t\t   ");
            int evalDoAfterBody = _jspx_th_c_005fforEach_005f0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_005fforEach_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return true;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_005fforEach_005f0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_005fforEach_005f0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_005fforEach_005f0.doFinally();
      }
    } finally {
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f0);
    }
    return false;
  }
}
