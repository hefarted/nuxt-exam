<script setup lang="ts">
import DoctorPageLayout from '~/components/DoctorPageLayout.vue'

const route = useRoute()

// --- Types
type Clinic = {
  slug: string
  name: string
  address: string
  phone: string
  email: string
  description: string
  lat: number
  lng: number
}

type Doctor = {
  slug: string
  name: string
  title: string
  specialization: string
  bio: string
  photo?: string
  clinics: string[]
}

// --- Local placeholder data
const clinics: Clinic[] = [
  {
    slug: 'healthway-bgc',
    name: 'Healthway Clinic – BGC',
    address: '9F Health Tower, 5th Ave, BGC, Taguig',
    phone: '(+63) 917 123 4567',
    email: 'bgc@healthway.ph',
    description: 'Full-service outpatient clinic with child-friendly facilities.',
    lat: 14.5505, lng: 121.0490
  },
  {
    slug: 'makati-med',
    name: 'Makati Medical Center',
    address: 'No. 2 Amorsolo St, Legazpi Village, Makati',
    phone: '(+63) 2 8888 8999',
    email: 'pediatrics@makatimed.ph',
    description: 'Hospital clinic with diagnostics and emergency support.',
    lat: 14.5586, lng: 121.0183
  }
]

const doctors: Doctor[] = [
  {
    slug: 'dr-maria-d-santos',
    name: 'Dr. Maria D. Santos',
    title: 'MD, FPPS',
    specialization: 'Pediatrician',
    bio: `Board-certified pediatrician with over 10 years of experience in preventive care,
immunization programs, and child wellness counseling. Passionate about empowering
parents through clear, evidence-based guidance.`,
    photo: '/images/dr-santos.jpg',
    clinics: ['healthway-bgc', 'makati-med']
  },
  {
    slug: 'john-reyes',
    name: 'Dr. John Reyes',
    title: 'MD, FPSGS',
    specialization: 'General Surgery',
    bio: 'Minimally invasive procedures and enhanced recovery protocols with patient-first approach.',
    photo: '/images/doctor-placeholder.svg',
    clinics: ['makati-med']
  }
]

// --- Find doctor by route param
const doctor = computed(() =>
  doctors.find(d => d.slug === String(route.params.name))
)

if (!doctor.value) {
  throw createError({ statusCode: 404, statusMessage: 'Doctor not found' })
}

// --- Clinics for this doctor
const doctorClinics = computed(() =>
  clinics.filter(c => doctor.value?.clinics.includes(c.slug))
)

// --- SEO
const pageUrl = computed(() => `${useRequestURL().origin}/doctors/${doctor.value!.slug}`)
useHead({
  title: `${doctor.value!.name} — ${doctor.value!.specialization}`,
  meta: [
    { name: 'description', content: doctor.value!.bio.slice(0, 160) },
    { property: 'og:title', content: `${doctor.value!.name} — ${doctor.value!.specialization}` },
    { property: 'og:description', content: doctor.value!.bio.slice(0, 160) },
    { property: 'og:image', content: doctor.value!.photo || '/images/doctor-placeholder.svg' }
  ],
  link: [{ rel: 'canonical', href: pageUrl.value }]
})
</script>

<template>
  <DoctorPageLayout>
    <!-- breadcrumb current -->
    <template #crumb-current>
      {{ doctor!.name }}
    </template>

    <!-- hero meta (left column) -->
    <template #hero-meta>
      <div class="inline-flex items-center gap-2 rounded-full bg-gray-100 px-3 py-1 text-xs font-medium text-gray-700">
        Trusted Care
      </div>
      <h1 class="mt-4 text-3xl sm:text-4xl md:text-5xl font-bold tracking-tight text-gray-900">
        {{ doctor!.name }}
      </h1>
      <p class="mt-2 text-base sm:text-lg text-gray-700">
        {{ doctor!.title }} · {{ doctor!.specialization }}
      </p>
      <p class="mt-4 text-gray-600 max-w-2xl">
        {{ doctor!.bio }}
      </p>
      <div class="mt-6 flex flex-wrap items-center gap-3">
        <NuxtLink
          to="/contact"
          class="inline-flex items-center justify-center rounded-xl bg-gray-900 px-5 py-3 text-sm font-semibold text-white hover:opacity-95"
        >
          Book an Appointment
        </NuxtLink>
        <NuxtLink
          v-if="doctorClinics[0]"
          :to="`/institutions/${doctorClinics[0].slug}`"
          class="inline-flex items-center justify-center rounded-xl border border-gray-300 px-5 py-3 text-sm font-semibold text-gray-800 hover:bg-gray-50"
        >
          Visit Clinic
        </NuxtLink>
      </div>
    </template>

    <!-- hero media (right column) -->
    <template #hero-media>
      <img
        :src="doctor!.photo || '/images/doctor-placeholder.svg'"
        :alt="`Portrait of ${doctor!.name}`"
        class="h-full w-full object-cover"
        loading="eager"
        fetchpriority="high"
        decoding="async"
      />
    </template>

    <!-- overview (main content) -->
    <template #overview>
      <h2 class="text-xl font-semibold">About {{ doctor!.name }}</h2>
      <p class="mt-3 text-gray-700 whitespace-pre-line">
        {{ doctor!.bio }}
      </p>
    </template>

    <!-- sidebar (clinics) -->
    <template #sidebar>
      <h2 class="text-xl font-semibold">Affiliated Clinics</h2>
      <div class="mt-4 space-y-4">
        <div
          v-for="c in doctorClinics"
          :key="c.slug"
          class="border-b last:border-0 border-gray-100 pb-4"
        >
          <NuxtLink :to="`/institutions/${c.slug}`" class="font-medium hover:underline">
            {{ c.name }}
          </NuxtLink>
          <p class="text-sm text-gray-600 mt-1">{{ c.address }}</p>
          <div class="mt-2 flex flex-wrap gap-3 text-sm text-gray-600">
            <a :href="`tel:${c.phone.replaceAll(' ', '')}`">📞 Call</a>
            <NuxtLink :to="`/institutions/${c.slug}`">📍 Directions</NuxtLink>
          </div>
        </div>
      </div>
    </template>
  </DoctorPageLayout>
</template>
