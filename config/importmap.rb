# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "jquery", to: "jquery/dist/jquery.js"
pin "jquery-ujs", to: "jquery-ujs/src/rails.js"
pin "bootstrap", to: "bootstrap/dist/js/bootstrap.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js"

pin "order_item"
pin "datepicker"

pin "bootstrap-datepicker"