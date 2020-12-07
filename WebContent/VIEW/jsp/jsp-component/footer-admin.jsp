
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url var="url" value="/VIEW"></c:url>
<script src="${url}/css/css-static/bootstrap/vendor/jquery/jquery.min.js"></script>
<script src="${url}/css/css-static/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Menu Toggle Script -->
<script>
  $("#menu-toggle").click(function (e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });

</script>
<script src="${url}/js/js-page/divide-page.js"></script>

<!-- search -->
<script>
  $(document).ready(function () {
    $("#myInput").on("keyup", function () {
      var value = $(this).val().toLowerCase();
      $("#content-table tr").filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
      });
    });
  });
</script>

<script>
  $(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
  });
</script>