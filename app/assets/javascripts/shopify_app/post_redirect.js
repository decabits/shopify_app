(function() {
  function redirect() {
    var form = document.getElementById("redirect-form");
    if (form) {
      form.submit();
    }
    setTimeout(function() {
      var continueApp = document.getElementById("continue-app");
      if (continueApp) {
        // Remove visibility set to use default
        continueApp.style.visibility = null;
      }
    }, 5000)
  }
  document.addEventListener("DOMContentLoaded", redirect);
})();
