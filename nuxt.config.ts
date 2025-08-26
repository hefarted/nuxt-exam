// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-07-15',
  devtools: { enabled: true },
  modules: [
    '@nuxtjs/tailwindcss',
    '@nuxtjs/google-fonts',
    '@nuxt/icon',
    '@nuxt/image'
  ],
  googleFonts: {
    families:{
      Montserrat:true
    }
  },
  image: {
    quality: 70,
    format: ['webp','avif'], // Nuxt Image will auto-serve modern formats
    presets: {
      doctorHero: {
        modifiers: { width: 960, height: 720, fit: 'cover' } // 4:3 hero
      }
    }
  }
})