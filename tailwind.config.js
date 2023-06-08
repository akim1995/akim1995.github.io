/** @type {import('tailwindcss').Config} */
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './src/**/*.elm'
  ],
  theme: {
    extend: {
      fontFamily: {
        'sans': ['Noto Sans', ...defaultTheme.fontFamily.sans],
      },
    }
    ,
  },
  plugins: [],
}

// npx tailwindcss -i ./src/main.css -o .styles.css --watch