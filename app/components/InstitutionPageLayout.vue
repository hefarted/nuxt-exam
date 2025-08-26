<script setup lang="ts">
/**
 * Reusable layout for a single Institution page
 *
 * Slots:
 *  - crumb-current : breadcrumb current text
 *  - hero          : top section (title + description)
 *  - details       : left side (address, phone, hours)
 *  - map           : right side (map embed)
 *  - doctors       : grid/list of doctors
 */
</script>

<template>
  <div>
    <!-- Hero -->
    <section class="bg-gradient-to-b from-white to-gray-50">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-10 md:py-16">
        <!-- Breadcrumbs -->
        <nav class="text-sm text-gray-600">
          <NuxtLink to="/" class="hover:underline">Home</NuxtLink>
          <span class="mx-1">›</span>
          <NuxtLink to="/institutions" class="hover:underline">Institutions</NuxtLink>
          <span class="mx-1">›</span>
          <slot name="crumb-current">
            <span class="text-gray-800">Institution Name</span>
          </slot>
        </nav>

        <div class="mt-4">
          <slot name="hero">
            <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold tracking-tight text-gray-900">
              Institution Name
            </h1>
            <p class="mt-4 max-w-2xl text-gray-600">
              Placeholder description for the institution.
            </p>
          </slot>
        </div>
      </div>
    </section>

    <!-- Details + Map -->
    <section class="py-12 md:py-16 bg-white">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 grid gap-8 lg:grid-cols-2">
        <div>
          <slot name="details">
            <p class="text-sm text-gray-700">Address, phone, hours go here.</p>
          </slot>
        </div>

        <div>
          <slot name="map">
            <div class="h-80 bg-gray-100 flex items-center justify-center rounded-xl text-gray-400">
              Map placeholder
            </div>
          </slot>
        </div>
      </div>
    </section>

    <!-- Doctors -->
    <section class="bg-gray-50 py-12 md:py-16">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <slot name="doctors">
          <h2 class="text-2xl font-bold text-gray-900">Doctors</h2>
          <p class="mt-2 text-gray-600 text-sm">List of doctors affiliated with this institution.</p>
        </slot>
      </div>
    </section>
  </div>
</template>
