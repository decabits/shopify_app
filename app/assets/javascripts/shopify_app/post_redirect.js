(function() {
  function redirect() {
    setTimeout(function() {
      var continueApp = document.getElementById("continue-app");
      if (continueApp) {
        // Remove visibility set to use default
        continueApp.style.visibility = null;
      }
    }, 5000)

    var form = document.getElementById("redirect-form");
    if (form) {
      form.submit();
    }
  }
  document.addEventListener("DOMContentLoaded", redirect);
})();
