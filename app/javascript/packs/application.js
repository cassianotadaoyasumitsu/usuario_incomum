// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// const Rails = require('rails-ujs');
// Rails.start();
require("turbolinks").start()
require("@rails/activestorage").start()
// require("channels")


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

import Vue from 'vue'
import TurbolinksAdapter from 'vue-turbolinks'

import App from '../app.vue'
import VueClipboard from 'vue-clipboard2'
import Clipboard from '../components/Clipboard.vue'
import 'idempotent-babel-polyfill'
import SharesCount from '../components/SharesCount.vue'
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
import Sharethis from '../applications/Sharethis.vue'

// Import Bootstrap an BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

// Make BootstrapVue available throughout your project
Vue.use(BootstrapVue)
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin)
Vue.use(TurbolinksAdapter)
Vue.use(VueClipboard)
VueClipboard.config.autoSetContainer = true

Vue.component('clipboard', Clipboard)
Vue.component('shares-count', SharesCount)
Vue.component('sharethis', Sharethis)

  document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '[data-behavior="vue-app"]'
  });
});

