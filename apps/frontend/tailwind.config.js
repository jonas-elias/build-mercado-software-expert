/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  daisyui: {
    themes: [
      {
        theme: {

          "primary": "#1d4ed8",

          "secondary": "#dc2626",

          "accent": "#1dcdbc",

          "neutral": "#2b3440",

          "base-100": "#ffffff",

          "info": "#a8a29e",

          "success": "#36d399",

          "warning": "#fbbd23",

          "error": "#b91c1c",
        },
      },
    ],
  },
  plugins: [require("daisyui")],
}

