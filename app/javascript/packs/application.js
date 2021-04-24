// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "core-js";
import "regenerator-runtime/runtime";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

// document.addEventListener('turbolinks:load', () => {
//   // Call your functions here, e.g:
//   // initSelect2();
// });
import 'babel-polyfill'
import Vue from 'vue'
import VueClipboard from 'vue-clipboard2'
import Clipboard from "../components/Clipboard/Clipboard.vue"

VueClipboard.config.autoSetContainer = true
Vue.use(VueClipboard)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '[data-behavior="vue-app"]',
    components: { Clipboard }
  })
})

import ShareCount from '../components/Share/SharesCount.vue'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#share',
    components: { LikeButton }
  })
})
