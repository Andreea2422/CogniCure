// Entry point for the build script in your package.json
// import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "../channels"
// import "jquery"
// import "bootstrap"
//
// Rails.start()
// Turbolinks.start()
// ActiveStorage.start()


require("@rails/ujs").start()
require("turbolinks")
require("@rails/activestorage").start()
require("../channels")
require("jquery")
import "jquery";
import "bootstrap";
import "chartkick/chart.js"


// document.addEventListener("DOMContentLoaded", function() {
//     const links = document.querySelectorAll("#source a");
//
//     links.forEach((link) => {
//         link.addEventListener("click", (event) => {
//             event.preventDefault();
//
//             const url = event.target.getAttribute("href");
//
//             fetch(url, { headers: { "X-Requested-With": "XMLHttpRequest" } })
//                 .then(response => response.text())
//                 .then(html => {
//                     const target = document.querySelector("#target");
//                     target.innerHTML = html;
//                 });
//         });
//     });
// });