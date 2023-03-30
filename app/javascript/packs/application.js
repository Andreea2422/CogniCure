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
require("turbo").start()
require("@rails/activestorage").start()
require("../channels")
require("jquery")
import "bootstrap"