<!-- /pages/index.vue -->
<script setup lang="ts">
import type { Doctor } from '../../types/doctor'
import type { Hours, Institution } from '../../types/institution'

const { data: doctors, pending, error } = await useFetch<Doctor[]>('/data/doctors.json', {
  server: false,     // fetch during SSR (so SEO bots get real content) false for exam purposes.
  lazy: false,      // block until resolved
  default: () => [] // initial value to avoid undefined during hydration
})

const { data: clinics }  = await useFetch<Institution[]>('/data/institutions.json', {   
  server: false,     // fetch during SSR (so SEO bots get real content) false for exam purposes.
  lazy: false,      // block until resolved
  default: () => [] // initial value to avoid undefined during hydration
})

// pick the doctor marked as featured, fallback to first
const featuredDoctor = computed(() => {
  const all = doctors.value || []
  return all.find(d => d.featured) ?? all[0] ?? null
})

const siteName = 'MedConnect'
const tagline = 'Trusted Healthcare Network in the Philippines'
const description = 'MedConnect links patients to trusted doctors and clinics across Metro Manila. Find specialists, book appointments, and get quality healthcare guidance.'


// SEO / head
// Apply SEO dynamically
watchEffect(() => {
  useSeoMeta({
    title: `${siteName} — ${tagline}`,
    description,
    ogTitle: `${siteName} — ${tagline}`,
    ogDescription: description,
    ogImage: '/images/branding-cover.jpg', // put a site-wide cover/hero image in /public/images
    ogType: 'website',
    twitterCard: 'summary_large_image'
  })

  const url = useRequestURL()
  useHead({
    link: [{ rel: 'canonical', href: url.origin }],
    script: [
      {
        type: 'application/ld+json',
        innerHTML: JSON.stringify({
          '@context': 'https://schema.org',
          '@type': 'WebSite',
          name: siteName,
          url: url.origin,
          description: description,
          publisher: {
            '@type': 'Organization',
            name: siteName,
            logo: {
              '@type': 'ImageObject',
              url: `${url.origin}/images/logo.png`
            }
          }
        })
      }
    ]
  })
})
</script>

<template>
  <div>

    <!-- Hero -->
    <section class="bg-gradient-to-b from-white to-gray-50">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-10 md:py-16 grid gap-8 md:grid-cols-5 items-center">
        <div class="md:col-span-3">
          <div class="inline-flex items-center gap-2 rounded-full bg-gray-100 px-3 py-1 text-xs font-medium text-gray-700">
            Trusted Pediatric Care
          </div>
          <h1 class="mt-4 text-3xl sm:text-4xl md:text-5xl font-bold tracking-tight text-gray-900">
            {{ featuredDoctor?.name }}
          </h1>
          <p class="mt-2 text-base sm:text-lg text-gray-700">
            {{ featuredDoctor?.title }} · {{ featuredDoctor?.specialization }}
          </p>
          <p class="mt-4 text-gray-600 max-w-2xl">
            {{ featuredDoctor?.bio }}
          </p>
          <div class="mt-6 flex flex-wrap items-center gap-3">
            <NuxtLink
              to="/contact"
              class="inline-flex items-center justify-center rounded-xl bg-gray-900 px-5 py-3 text-sm font-semibold text-white hover:opacity-95 focus:outline-none focus-visible:ring-2 focus-visible:ring-gray-400"
            >
              Book an Appointment
            </NuxtLink>
            <NuxtLink
              to="/doctors/dr-maria-d-santos"
              class="inline-flex items-center justify-center rounded-xl border border-gray-300 px-5 py-3 text-sm font-semibold text-gray-800 hover:bg-gray-50"
            >
              View Full Profile
            </NuxtLink>
          </div>
          <p class="mt-3 text-xs text-gray-500">
            Serving families in BGC and Makati. Walk-ins welcome subject to availability.
          </p>
        </div>

        <div class="md:col-span-2">
          <div class="mx-auto aspect-[4/3] w-full max-w-md overflow-hidden rounded-2xl border border-gray-200 bg-white shadow-sm">
            <NuxtImg
              :src="featuredDoctor?.photo || '/images/doctor-placeholder.svg'"
              :alt="`Portrait of ${featuredDoctor?.name || 'the doctor'}`"
              preset="doctorHero"
              placeholder="blur"
              loading="eager"
              fetchpriority="high"
              decoding="async"
              class="h-full w-full object-cover"
            />
          </div>
        </div>

      </div>
    </section>

    <!-- Clinics / Institutions -->
    <section class="py-12 md:py-16">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="flex items-end justify-between gap-4">
          <div>
            <h2 class="text-2xl font-bold text-gray-900">Affiliated Clinics & Institutions</h2>
            <p class="mt-1 text-sm text-gray-600">Find location, hours, and contact details.</p>
          </div>
          <NuxtLink
            to="/institutions"
            class="hidden sm:inline-flex items-center justify-center rounded-xl border border-gray-300 px-4 py-2 text-sm font-semibold text-gray-800 hover:bg-gray-50"
          >
            Browse all
          </NuxtLink>
        </div>

        <div class="mt-6 grid gap-6 sm:grid-cols-2">
          <article
            v-for="c in clinics"
            :key="c.slug"
            class="rounded-2xl border border-gray-200 bg-white p-5 shadow-sm"
          >
            <div class="flex items-start justify-between gap-4">
              <div>
                <NuxtLink
                  :to="`/institutions/${c.slug}`"
                  class="text-lg font-semibold text-gray-900 hover:underline"
                >
                  {{ c.name }}
                </NuxtLink>
                <p class="mt-1 text-sm text-gray-600">{{ c.description }}</p>
              </div>
              <NuxtLink
                :to="`/institutions/${c.slug}`"
                class="hidden sm:inline-flex rounded-lg border border-gray-300 px-3 py-1.5 text-xs font-medium text-gray-800 hover:bg-gray-50"
              >
                Details
              </NuxtLink>
            </div>

            <div class="mt-4 grid gap-4 md:grid-cols-2">
              <div class="space-y-2 text-sm">
                <p class="text-gray-800"><span class="font-medium">Address:</span> {{ c.address }}</p>
                <p class="text-gray-800"><span class="font-medium">Phone:</span> {{ c.phone }}</p>
                <p class="text-gray-800"><span class="font-medium">Email:</span> {{ c.email }}</p>
                <div>
                  <p class="font-medium text-gray-800">Opening Hours</p>
                  <ul class="mt-1 space-y-0.5 text-gray-600">
                    <li v-for="h in c.hours" :key="h.day">
                      {{ h.day }}:
                      <span v-if="h.close">{{ h.open }}–{{ h.close }}</span>
                      <span v-else>Closed</span>
                    </li>
                  </ul>
                </div>
              </div>

              <!-- Map (OpenStreetMap embed so no API key needed) -->
              <div class="overflow-hidden rounded-xl border border-gray-200">
                <iframe
                  :title="`Map of ${c.name}`"
                  :src="`https://www.openstreetmap.org/export/embed.html?bbox=${c.lng-0.01}%2C${c.lat-0.01}%2C${c.lng+0.01}%2C${c.lat+0.01}&layer=mapnik&marker=${c.lat}%2C${c.lng}`"
                  class="h-56 w-full"
                  loading="lazy"
                  referrerpolicy="no-referrer-when-downgrade"
                ></iframe>
              </div>
            </div>
          </article>
        </div>
      </div>
    </section>

    <!-- About the Doctor / Trust section -->
    <section class="bg-gray-50 py-12 md:py-16">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 grid gap-8 md:grid-cols-2 items-center">
        <div>
          <h2 class="text-2xl font-bold text-gray-900">Why families choose Dr. Santos</h2>
          <ul class="mt-4 space-y-2 text-gray-700">
            <li>• Evidence-based pediatric care and clear after-visit guidance</li>
            <li>• Convenient clinic locations in BGC and Makati</li>
            <li>• Teleconsult options for follow-ups</li>
            <li>• Friendly, kid-first approach</li>
          </ul>
        </div>
        <div class="rounded-2xl border border-gray-200 bg-white p-5 shadow-sm">
          <h3 class="text-sm font-semibold text-gray-900">Next steps</h3>
          <p class="mt-2 text-sm text-gray-600">Have questions about schedules, vaccines, or fees?</p>
          <div class="mt-4 flex flex-col sm:flex-row gap-3">
            <NuxtLink
              to="/contact"
              class="inline-flex items-center justify-center rounded-xl bg-gray-900 px-5 py-3 text-sm font-semibold text-white hover:opacity-95"
            >
              Contact Clinic
            </NuxtLink>
            <NuxtLink
              to="/doctors/dr-maria-d-santos"
              class="inline-flex items-center justify-center rounded-xl border border-gray-300 px-5 py-3 text-sm font-semibold text-gray-800 hover:bg-gray-50"
            >
              View Profile
            </NuxtLink>
          </div>
        </div>
      </div>
    </section>
    
  </div>
</template>

<style scoped>
/* Helpful for iOS tap highlight and smoother feel */
@media (pointer: coarse) {
  a, button { -webkit-tap-highlight-color: transparent; }
}
</style>
