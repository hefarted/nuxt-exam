<!-- /pages/index.vue -->
<script setup lang="ts">
type Hours = { day: string; open: string; close: string }
type Clinic = {
  slug: string
  name: string
  address: string
  phone: string
  email: string
  description: string
  hours: Hours[]
  lat: number
  lng: number
}

const doctor = {
  name: 'Dr. Maria D. Santos',
  title: 'MD, FPPS',
  specialization: 'Pediatrician',
  bio: `Board-certified pediatrician with over 10 years of experience in preventive care,
  immunization programs, and child wellness counseling. Passionate about empowering
  parents through clear, evidence-based guidance.`,
  photo: '/images/dr-santos.jpg' // optional placeholder, replace with your asset
}

const clinics: Clinic[] = [
  {
    slug: 'healthway-bgc',
    name: 'Healthway Clinic – BGC',
    address: '9F Health Tower, 5th Ave, BGC, Taguig',
    phone: '(+63) 917 123 4567',
    email: 'bgc@healthway.ph',
    description: 'Full-service outpatient clinic with child-friendly facilities.',
    hours: [
      { day: 'Mon–Fri', open: '09:00', close: '18:00' },
      { day: 'Sat', open: '09:00', close: '14:00' },
      { day: 'Sun', open: 'Closed', close: '' }
    ],
    lat: 14.5505, lng: 121.0490
  },
  {
    slug: 'makati-med',
    name: 'Makati Medical Center',
    address: 'No. 2 Amorsolo St, Legazpi Village, Makati',
    phone: '(+63) 2 8888 8999',
    email: 'pediatrics@makatimed.ph',
    description: 'Hospital clinic with diagnostics and emergency support.',
    hours: [
      { day: 'Mon–Fri', open: '10:00', close: '17:00' },
      { day: 'Sat', open: '10:00', close: '13:00' },
      { day: 'Sun', open: 'Closed', close: '' }
    ],
    lat: 14.5586, lng: 121.0183
  }
]

// SEO / head
useHead({
  title: `${doctor.name} – ${doctor.specialization}`,
  meta: [
    { name: 'description', content: `Public profile of ${doctor.name}, ${doctor.title}. Clinics, schedule, and contact details.` },
    { property: 'og:title', content: `${doctor.name} · ${doctor.specialization}` },
    { property: 'og:description', content: `Clinics and schedule for ${doctor.name}. Book an appointment.` },
    { property: 'og:type', content: 'website' }
  ],
  link: [
    { rel: 'canonical', href: 'https://example.com/' } // update to your domain
  ],
  script: [
    // Physician + first clinic structured data (expand as needed)
    {
      type: 'application/ld+json',
      innerHTML: JSON.stringify({
        '@context': 'https://schema.org',
        '@type': 'Physician',
        name: doctor.name,
        medicalSpecialty: doctor.specialization,
        description: doctor.bio,
        image: doctor.photo,
        affiliatedHospital: clinics.map(c => ({
          '@type': 'MedicalClinic',
          name: c.name,
          address: c.address,
          telephone: c.phone
        }))
      })
    }
  ]
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
            {{ doctor.name }}
          </h1>
          <p class="mt-2 text-base sm:text-lg text-gray-700">
            {{ doctor.title }} · {{ doctor.specialization }}
          </p>
          <p class="mt-4 text-gray-600 max-w-2xl">
            {{ doctor.bio }}
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
            <!-- Placeholder doctor photo; replace with real image -->
            <img
              :src="doctor.photo"
              alt="Portrait of the doctor"
              class="h-full w-full object-cover"
              loading="eager"
              fetchpriority="high"
              decoding="async"
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
