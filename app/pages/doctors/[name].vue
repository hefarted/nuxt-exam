<script setup lang="ts">
const route = useRoute()
const displayName = computed(() => String(route.params.name || 'doctor-name').replace(/-/g, ' '))
</script>

<template>
  <DoctorPageLayout>
    <template #crumb-current>
      <span class="capitalize">{{ displayName }}</span>
    </template>

    <template #hero-media>
      <!-- <img src="/images/doctor-placeholder.svg" alt="Doctor portrait" class="w-full h-auto" /> -->
    </template>

    <template #hero-meta>
      <h1 class="text-3xl md:text-4xl font-bold tracking-tight capitalize">{{ displayName }}</h1>
      <p class="mt-1 text-primary font-semibold">MD, FPCP — Cardiology</p>
      <div class="mt-3 flex flex-wrap gap-2">
        <span class="badge">Preventive</span>
        <span class="badge">Diagnostics</span>
        <span class="badge">Rehab</span>
      </div>
      <div class="mt-4 flex gap-3">
        <button class="btn btn-primary">Book Appointment</button>
        <button class="btn btn-outline">Call</button>
      </div>
    </template>

    <template #overview>
      <h2 class="text-xl font-semibold">Overview</h2>
      <p class="mt-3 text-gray-700">
        Replace this with the doctor’s full biography. Keep paragraphs short for readability.
      </p>
      <h3 class="mt-6 font-semibold">Qualifications</h3>
      <ul class="mt-2 list-disc list-inside text-gray-700 text-sm">
        <li>Board-certified</li>
        <li>Member, Philippine College of Physicians</li>
        <li>10+ years clinical experience</li>
      </ul>
    </template>

    <template #sidebar>
      <h2 class="text-xl font-semibold">Affiliated Clinics</h2>
      <div class="mt-4 space-y-4">
        <div class="border-b last:border-0 border-gray-100 pb-4">
          <NuxtLink to="/institutions/green-valley-medical-center" class="font-medium hover:underline">
            Green Valley Medical Center
          </NuxtLink>
          <p class="text-sm text-gray-600 mt-1">123 Green Ave, Mandaluyong</p>
          <div class="mt-2 flex flex-wrap gap-3 text-sm text-gray-600">
            <a href="tel:+63281234567" class="flex items-center gap-1"><img src="/images/icons/phone.svg" class="h-4 w-4" /> Call</a>
            <NuxtLink to="/institutions/green-valley-medical-center" class="flex items-center gap-1">
              <img src="/images/icons/map-pin.svg" class="h-4 w-4" /> Directions
            </NuxtLink>
          </div>
        </div>
      </div>
    </template>
  </DoctorPageLayout>
</template>
