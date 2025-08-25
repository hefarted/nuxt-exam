<script setup lang="ts">
/**
 * Simple, semantic footer with slots to inject clinic/contact info.
 * Add your social links below or pass them via slots.
 */
const year = new Date().getFullYear()
</script>

<template>
  <footer class="mt-12 border-t border-gray-200 bg-white">
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-10 grid gap-8 md:grid-cols-4">
      <!-- Brand / About -->
      <div class="md:col-span-2">
        <div class="flex items-center gap-3">
          <span class="inline-flex h-9 w-9 items-center justify-center rounded-xl bg-gray-900 text-white font-bold">MD</span>
          <span class="text-base font-semibold tracking-tight text-gray-900">MedProfile</span>
        </div>
        <p class="mt-3 text-sm text-gray-600">
          Public profile and clinic information for licensed medical professionals.
          Built with Nuxt 3, SSR, and SEO best practices.
        </p>
        <div class="mt-4 flex items-center gap-4">
          <!-- Replace with real links/icons -->
          <a href="#" class="text-sm text-gray-600 hover:text-gray-900" aria-label="Facebook">Facebook</a>
          <a href="#" class="text-sm text-gray-600 hover:text-gray-900" aria-label="Instagram">Instagram</a>
          <a href="#" class="text-sm text-gray-600 hover:text-gray-900" aria-label="LinkedIn">LinkedIn</a>
        </div>
      </div>

      <!-- Contact / Slots -->
      <div>
        <h3 class="text-sm font-semibold text-gray-900">Contact</h3>
        <ul class="mt-3 space-y-1 text-sm text-gray-600">
          <li><span class="font-medium text-gray-800">Phone:</span> <slot name="phone">(+63) 900 000 0000</slot></li>
          <li><span class="font-medium text-gray-800">Email:</span> <slot name="email">hello@medprofile.example</slot></li>
          <li><span class="font-medium text-gray-800">Address:</span> <slot name="address">123 Health Ave, BGC, Taguig</slot></li>
        </ul>
      </div>

      <!-- Opening Hours -->
      <div>
        <h3 class="text-sm font-semibold text-gray-900">Opening Hours</h3>
        <ul class="mt-3 space-y-1 text-sm text-gray-600">
          <li>Mon–Fri: 9:00 AM – 6:00 PM</li>
          <li>Sat: 9:00 AM – 2:00 PM</li>
          <li>Sun: Closed</li>
        </ul>
      </div>
    </div>

    <div class="border-t border-gray-200">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-4 flex flex-col sm:flex-row items-center justify-between">
        <p class="text-xs text-gray-500">
          © {{ year }} MedProfile. All rights reserved.
        </p>
        <nav aria-label="Legal links" class="mt-2 sm:mt-0 flex items-center gap-4">
          <NuxtLink to="/privacy" class="text-xs text-gray-500 hover:text-gray-900">Privacy</NuxtLink>
          <NuxtLink to="/terms" class="text-xs text-gray-500 hover:text-gray-900">Terms</NuxtLink>
          <NuxtLink to="/sitemap.xml" class="text-xs text-gray-500 hover:text-gray-900">Sitemap</NuxtLink>
        </nav>
      </div>
    </div>
  </footer>
</template>