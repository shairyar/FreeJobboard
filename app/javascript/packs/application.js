// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("local-time").start();

window.Rails = Rails

import 'bootstrap'
import 'data-confirm-modal'
import 'selectize'
$(document).on("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();
});


// being used on new job view
$(document).on("turbolinks:load", function() {
  var selectizeCallback = null;

  $(".category-modal").on("hide.bs.modal", function(e) {
    if (selectizeCallback != null) {
      selectizeCallback();
      selecitzeCallback = null;
    }

    $("#new_category").trigger("reset");
    $.rails.enableFormElements($("#new_category"));
  });

  function create_new_skill(new_skill){
    let skill = {
      name: new_skill
    };
    $.ajax({
      type: 'post',
      url: '/skills',
      data: JSON.stringify(skill),
      contentType: "application/json; charset=utf-8",
      traditional: true,
      success: function (response) {
        selectizeCallback({value: response.id, text: response.name});
        selectizeCallback = null;
      }
    });
  }

  $(".selectize").selectize({
    create: function(input, callback) {
      selectizeCallback = callback;
      create_new_skill(input);
    }
  });
});