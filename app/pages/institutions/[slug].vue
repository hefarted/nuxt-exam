<script setup lang="ts">
import InstitutionPageLayout from '~/components/InstitutionPageLayout.vue'

const route = useRoute()

// ---- Types
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
type Doctor = {
  slug: string
  name: string
  title: string
  specialization: string
  photo?: string
  clinics: string[]
}

// ---- Local placeholder data
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

const doctors: Doctor[] = [
  {
    slug: 'dr-maria-d-santos',
    name: 'Dr. Maria D. Santos',
    title: 'MD, FPPS',
    specialization: 'Pediatrician',
    photo: '',
    clinics: ['healthway-bgc', 'makati-med']
  },
  {
    slug: 'john-reyes',
    name: 'Dr. John Reyes',
    title: 'MD, FPSGS',
    specialization: 'General Surgery',
    photo: '/images/doctor-placeholder.svg',
    clinics: ['makati-med']
  }
]

// ---- Find institution by slug
const institution = computed(() =>
  clinics.find(c => c.slug === String(route.params.slug))
)

if (!institution.value) {
  throw createError({ statusCode: 404, statusMessage: 'Institution not found' })
}

// ---- Doctors in this institution
const institutionDoctors = computed(() =>
  doctors.filter(d => d.clinics.includes(institution.value!.slug))
)

// ---- SEO
useHead({
  title: `${institution.value!.name} — Clinics & Institutions`,
  meta: [
    { name: 'description', content: institution.value!.description },
    { property: 'og:title', content: institution.value!.name },
    { property: 'og:description', content: institution.value!.description }
  ],
  link: [
    { rel: 'canonical', href: `${useRequestURL().origin}/institutions/${institution.value!.slug}` }
  ]
})
</script>

<template>
  <InstitutionPageLayout>
    <!-- breadcrumb -->
    <template #crumb-current>
      {{ institution!.name }}
    </template>

    <!-- hero -->
    <template #hero>
      <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold tracking-tight text-gray-900">
        {{ institution!.name }}
      </h1>
      <p class="mt-4 max-w-2xl text-gray-600">
        {{ institution!.description }}
      </p>
    </template>

    <!-- details -->
    <template #details>
      <div class="space-y-3 text-sm text-gray-700">
        <p><span class="font-medium">Address:</span> {{ institution!.address }}</p>
        <p><span class="font-medium">Phone:</span> {{ institution!.phone }}</p>
        <p><span class="font-medium">Email:</span> {{ institution!.email }}</p>

        <div>
          <p class="font-medium text-gray-800">Opening Hours</p>
          <ul class="mt-1 space-y-0.5 text-gray-600">
            <li v-for="h in institution!.hours" :key="h.day">
              {{ h.day }}:
              <span v-if="h.close">{{ h.open }}–{{ h.close }}</span>
              <span v-else>Closed</span>
            </li>
          </ul>
        </div>
      </div>
    </template>

    <!-- map -->
    <template #map>
      <div class="rounded-xl border border-gray-200 overflow-hidden">
        <iframe
          :title="`Map of ${institution!.name}`"
          :src="`https://www.openstreetmap.org/export/embed.html?bbox=${institution!.lng-0.01}%2C${institution!.lat-0.01}%2C${institution!.lng+0.01}%2C${institution!.lat+0.01}&layer=mapnik&marker=${institution!.lat}%2C${institution!.lng}`"
          class="h-80 w-full"
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade"
        ></iframe>
      </div>
    </template>

    <!-- doctors -->
    <template #doctors>
      <h2 class="text-2xl font-bold text-gray-900">Doctors at {{ institution!.name }}</h2>
      <div class="mt-6 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        <article
          v-for="d in institutionDoctors"
          :key="d.slug"
          class="rounded-2xl border border-gray-200 bg-white p-5 shadow-sm"
        >
          <div class="flex gap-4">
            <img
              :src="d.photo || '/images/doctor-placeholder.svg'"
              class="h-20 w-20 rounded-xl object-cover bg-gray-100"
              :alt="`Portrait of ${d.name}`"
            />
            <div>
              <NuxtLink
                :to="`/doctors/${d.slug}`"
                class="text-lg font-semibold text-gray-900 hover:underline"
              >
                {{ d.name }}
              </NuxtLink>
              <p class="text-sm text-gray-600">{{ d.title }} · {{ d.specialization }}</p>
            </div>
          </div>
        </article>
      </div>
    </template>
  </InstitutionPageLayout>
</template>
