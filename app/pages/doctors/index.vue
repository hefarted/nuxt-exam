<script setup lang="ts">
useHead({
  title: 'Doctors',
  meta: [{ name: 'description', content: 'Browse doctors and view their profiles.' }],
  link: [{ rel: 'canonical', href: useRequestURL().origin + '/doctors' }],
})

// placeholder doctors (no JSON yet)
const doctors = [
  { slug: 'dr-maria-d-santos', name: 'Dr. Maria D. Santos', title: 'MD, FPPS', specialization: 'Pediatrician' },
  { slug: 'john-reyes', name: 'Dr. John Reyes', title: 'MD, FPSGS', specialization: 'General Surgery' },
  { slug: 'ana-cruz', name: 'Dr. Ana Cruz', title: 'MD', specialization: 'Pediatrics' }
]
</script>

<template>
  <DoctorsIndexLayout>
    <!-- Header -->
    <template #header>
      <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold tracking-tight text-gray-900">Doctors</h1>
      <p class="mt-2 text-base sm:text-lg text-gray-700">
        Browse specialists and open full profiles.
      </p>
    </template>

    <!-- Filters (still just UI) -->
    <template #filters>
      <input
        type="search"
        placeholder="Search doctors…"
        class="w-full sm:w-64 rounded-xl border border-gray-300 bg-white px-3 py-2 text-sm
               focus:outline-none focus-visible:ring-2 focus-visible:ring-gray-300"
      />
      <select
        class="w-full sm:w-56 rounded-xl border border-gray-300 bg-white px-3 py-2 text-sm
               focus:outline-none focus-visible:ring-2 focus-visible:ring-gray-300"
      >
        <option>All specializations</option>
        <option>Pediatrician</option>
        <option>General Surgery</option>
      </select>
    </template>

    <!-- Meta line -->
    <template #meta>
      <p class="text-sm text-gray-600">
        Showing <span class="font-medium">{{ doctors.length }}</span> doctors
      </p>
    </template>

    <!-- Grid of doctors (placeholder layout) -->
    <template #grid>
      <div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        <article
          v-for="d in doctors"
          :key="d.slug"
          class="rounded-2xl border border-gray-200 bg-white p-5 shadow-sm"
        >
          <h3 class="text-lg font-semibold text-gray-900">{{ d.name }}</h3>
          <p class="text-sm text-gray-600">{{ d.title }} · {{ d.specialization }}</p>
          <NuxtLink
            :to="`/doctors/${d.slug}`"
            class="mt-3 inline-flex items-center justify-center rounded-lg border border-gray-300 px-3 py-1.5 text-xs font-medium text-gray-800 hover:bg-gray-50"
          >
            View profile
          </NuxtLink>
        </article>
      </div>
    </template>
  </DoctorsIndexLayout>
</template>
