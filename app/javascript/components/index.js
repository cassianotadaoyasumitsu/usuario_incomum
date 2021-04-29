import Vue from 'vue'

const req = require.context('components', true, /\.vue$/)

function capitalize (word) {
  return word.charAt(0).toUpperCase() + word.substring(1)
}

function titleize (words) {
  return words.match(/\w+/g).map(capitalize).join('')
}

function constantize (filename) {
  return titleize(filename.match(/^(?:\.\/)?(.+)(?:\.vue$)$/)[1])
}

req.keys().map(key => Vue.component(constantize(key), req(key).default))
