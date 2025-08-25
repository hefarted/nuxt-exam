<script setup lang="ts">
import { ref, onMounted, onBeforeUnmount } from 'vue'
import { useRoute } from 'vue-router'

/**
 * Props (customize as needed)
 * - showCta: shows a right-side call-to-action button (e.g., "Book Appointment")
 * - ctaText: text for the CTA
 * - ctaTo: route for the CTA
 */
const props = withDefaults(defineProps<{
  showCta?: boolean
  ctaText?: string
  ctaTo?: string
}>(), {
  showCta: true,
  ctaText: 'Book Appointment',
  ctaTo: '/contact'
})

const open = ref(false)
const scrolled = ref(false)
const route = useRoute()

const links = [
  { label: 'Home', to: '/' },
  { label: 'Doctors', to: '/doctors' },
  { label: 'Institutions', to: '/institutions' },
  { label: 'Contact', to: '/contact' }
]

function closeOnEscape(e: KeyboardEvent) {
  if (e.key === 'Escape') open.value = false
}

onMounted(() => {
  window.addEventListener('keydown', closeOnEscape)
  window.addEventListener('scroll', () => {
    scrolled.value = window.scrollY > 4
  }, { passive: true })
})

onBeforeUnmount(() => {
  window.removeEventListener('keydown', closeOnEscape)
})

function isActive(path: string) {
  return route.path === path || route.path.startsWith(path + '/')
}
</script>

<template>
  <header
    :class="[
      'sticky top-0 z-40 w-full transition-shadow bg-white/80 backdrop-blur supports-[backdrop-filter]:bg-white/60',
      scrolled ? 'shadow-sm' : ''
    ]"
    role="banner"
  >
    <nav class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8" aria-label="Primary">
      <div class="flex h-16 items-center justify-between">
        <!-- Left: Brand -->
        <div class="flex items-center gap-3">
          <NuxtLink to="/" class="flex items-center gap-2 group" aria-label="Go to homepage">
            <!-- Replace with your logo -->
            <span class="inline-flex h-9 w-9 items-center justify-center rounded-xl bg-gray-900 text-white font-bold">
              MD
            </span>
            <span class="text-base font-semibold tracking-tight text-gray-900 group-hover:opacity-90">
              MedProfile
            </span>
          </NuxtLink>
        </div>

        <!-- Center: Desktop links -->
        <div class="hidden md:flex items-center gap-1">
          <NuxtLink
            v-for="l in links"
            :key="l.to"
            :to="l.to"
            class="px-3 py-2 text-sm font-medium rounded-xl transition"
            :class="isActive(l.to)
              ? 'text-gray-900 bg-gray-100'
              : 'text-gray-600 hover:text-gray-900 hover:bg-gray-50'"
          >
            {{ l.label }}
          </NuxtLink>
        </div>

        <!-- Right: CTA (desktop) -->
        <div class="hidden md:flex items-center gap-3">
          <slot name="right" />
          <NuxtLink
            v-if="showCta"
            :to="ctaTo"
            class="inline-flex items-center justify-center rounded-xl px-4 py-2 text-sm font-semibold bg-gray-900 text-white hover:opacity-95 focus:outline-none focus-visible:ring-2 focus-visible:ring-gray-400"
          >
            {{ ctaText }}
          </NuxtLink>
          <!-- Mobile menu button -->
          <button
            class="md:hidden inline-flex h-10 w-10 items-center justify-center rounded-xl border border-gray-200"
            @click="open = !open"
            :aria-expanded="open"
            aria-controls="mobile-menu"
            aria-label="Toggle menu"
          >
            <span v-if="!open" aria-hidden="true">☰</span>
            <span v-else aria-hidden="true">✕</span>
          </button>
        </div>

        <!-- Right: Mobile button (when no CTA slot) -->
        <div class="md:hidden">
          <button
            class="inline-flex h-10 w-10 items-center justify-center rounded-xl border border-gray-200"
            @click="open = !open"
            :aria-expanded="open"
            aria-controls="mobile-menu"
            aria-label="Toggle menu"
          >
            <span v-if="!open" aria-hidden="true">☰</span>
            <span v-else aria-hidden="true">✕</span>
          </button>
        </div>
      </div>

      <!-- Mobile panel -->
      <div
        id="mobile-menu"
        class="md:hidden"
        :class="open ? 'block' : 'hidden'"
      >
        <div class="mt-2 space-y-1 pb-4">
          <NuxtLink
            v-for="l in links"
            :key="l.to"
            :to="l.to"
            class="block px-3 py-3 text-base font-medium rounded-lg"
            :class="isActive(l.to)
              ? 'text-gray-900 bg-gray-100'
              : 'text-gray-700 hover:text-gray-900 hover:bg-gray-50'"
            @click="open = false"
          >
            {{ l.label }}
          </NuxtLink>

          <div class="px-3">
            <NuxtLink
              v-if="showCta"
              :to="ctaTo"
              class="mt-1 block w-full text-center rounded-xl bg-gray-900 px-4 py-3 text-sm font-semibold text-white hover:opacity-95"
              @click="open = false"
            >
              {{ ctaText }}
            </NuxtLink>
          </div>

          <slot name="mobile-extra" />
        </div>
      </div>
    </nav>
  </header>
</template>

<style scoped>
/* Optional: reduce tap highlight on mobile */
@media (pointer: coarse) {
  a, button { -webkit-tap-highlight-color: transparent; }
}
</style>
