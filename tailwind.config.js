/** @type {import('tailwindcss').Config} */
const forms = require('@tailwindcss/forms')

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/views/**/*.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
  ],
  plugins: [ forms ],
  theme: {
    extend: {},
  },
}
