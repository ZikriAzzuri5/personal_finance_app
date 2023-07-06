/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './node_modules/flowbite/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily:{
        body: ['Poppins']
      },
      colors: {
        primary: '#5B9279',
        secondary: '#8FCB9B',
        bgColor: '#EAE6E5',
        dark: '#12130F',
        brown: '#8F8073'
      }
    },
  },
  plugins: [
    require('flowbite/plugin')
  ],
}

