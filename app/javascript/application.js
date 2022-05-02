// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "chartkick"
import "Chart.bundle"

$(document).ready(function () {
    $("#table-search").on("keyup", function (e) {
    });

    $('#categoryy-select').on('change', function (event) {
        $.ajax({
            type: "GET",
            url: "ecommerce/product_based_on_category",
            data: {
                category_id: this.value
            },
            success: function (result) {

                $(document).find("#stock-report").remove();

                $(document).find('#list_products').append(result);
            }
        })
        event.preventDefault(); // Prevent link from following its href
    });
    $('#stockstatus-select').on('change', function (event) {
        $.ajax({
            type: "GET",
            url: "ecommerce/product_based_on_stockstatus",

            data: {
                status_id: this.value
            },
            success: function (result) {

                $(document).find("#stock-report").remove();

                $(document).find('#list_products').append(result);

            }
        })
        event.preventDefault(); // Prevent link from following its href
    });
});