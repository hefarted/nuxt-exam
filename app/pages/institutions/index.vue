<!-- pages/institutions/index.vue -->
<script setup lang="ts">
useHead({
  title: 'Clinics & Institutions',
  meta: [{ name: 'description', content: 'Browse clinics and find addresses, hours, and contacts.' }],
  link: [{ rel: 'canonical', href: useRequestURL().origin + '/institutions' }],
})

// Placeholder institutions (no JSON yet)
const institutions = [
  {
    slug: 'healthway-bgc',
    name: 'Healthway Clinic – BGC',
    address: '9F Health Tower, 5th Ave, BGC, Taguig',
    phone: '(+63) 917 123 4567',
    email: 'bgc@healthway.ph',
    description: 'Full-service outpatient clinic with child-friendly facilities.'
  },
  {
    slug: 'makati-med',
    name: 'Makati Medical Center',
    address: 'No. 2 Amorsolo St, Legazpi Village, Makati',
    phone: '(+63) 2 8888 8999',
    email: 'pediatrics@makatimed.ph',
    description: 'Hospital clinic with diagnostics and emergency support.'
  }
]
</script>

<template>
  <InstitutionsIndexLayout>
    <!-- Header -->
    <template #header>
      <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold tracking-tight text-gray-900">
        Clinics & Institutions
      </h1>
      <p class="mt-2 text-base sm:text-lg text-gray-700">
        Find location, hours, and contact details.
      </p>
    </template>

    <!-- Filters (UI only) -->
    <template #filters>
      <input
        type="search"
        placeholder="Search clinics…"
        class="w-full sm:w-64 rounded-xl border border-gray-300 bg-white px-3 py-2 text-sm
               focus:outline-none focus-visible:ring-2 focus-visible:ring-gray-300"
      />
      <select
        class="w-full sm:w-56 rounded-xl border border-gray-300 bg-white px-3 py-2 text-sm
               focus:outline-none focus-visible:ring-2 focus-visible:ring-gray-300"
      >
        <option>All locations</option>
        <option>Taguig</option>
        <option>Makati</option>
      </select>
    </template>

    <!-- Meta -->
    <template #meta>
      <p class="text-sm text-gray-600">
        Showing <span class="font-medium">{{ institutions.length }}</span> institution<span v-if="institutions.length !== 1">s</span>
      </p>
    </template>

    <!-- Grid/List -->
    <template #grid>
      <div class="grid gap-6 sm:grid-cols-2">
        <article
          v-for="c in institutions"
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

          <div class="mt-4 grid gap-4 md:grid-cols-2 text-sm">
            <div class="space-y-1.5 text-gray-700">
              <p><span class="font-medium">Address:</span> {{ c.address }}</p>
              <p><span class="font-medium">Phone:</span> {{ c.phone }}</p>
              <p><span class="font-medium">Email:</span> {{ c.email }}</p>
            </div>
            <div class="rounded-xl border border-gray-200 overflow-hidden">
              <div class="h-40 bg-gray-100 flex items-center justify-center text-gray-400 text-xs">
                Map placeholder
              </div>
            </div>
          </div>
        </article>
      </div>
    </template>

    <!-- Empty (optional) -->
    <template #empty></template>
  </InstitutionsIndexLayout>
</template>
