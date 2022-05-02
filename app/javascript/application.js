// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


$(document).ready(function () {
    $("#table-search").on("keyup", function (e) {
    });

    $('#category-select').on('change', function (event) {
        $.ajax({
            type: "GET",
            url: "ecommerce/order_based_on_category",
            data: {
                category_id: this.value
            },
            success: function (result) {

                $(document).find("#product-orders").remove();

                $(document).find('#list_product_orders').append(result);
            }
        })
        event.preventDefault(); // Prevent link from following its href
    });
    $('#orderstatus-select').on('change', function (event) {
        $.ajax({
            type: "GET",
            url: "ecommerce/order_based_on_stockstatus",

            data: {
                status_id: this.value
            },
            success: function (result) {

                $(document).find("#product-orders").remove();

                $(document).find('#list_product_orders').append(result);

            }
        })
        event.preventDefault(); // Prevent link from following its href
    });
});

