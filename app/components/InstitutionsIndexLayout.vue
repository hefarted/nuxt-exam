<!-- components/InstitutionsIndexLayout.vue -->
<script setup lang="ts">
/**
 * Reusable grid layout for the Institutions index page.
 * Slots:
 *  - header   : page title + intro
 *  - filters  : search / city filter controls
 *  - meta     : result count / helper text
 *  - grid     : your list/grid items
 *  - empty    : empty state
 *
 * Alignment:
 *  - Same container rhythm as Home/Doctors: max-w-7xl + px-4 sm:px-6 lg:px-8
 *  - Section spacing: py-12 md:py-16
 */
</script>

<template>
  <section class="py-12 md:py-16 bg-white">
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
      <!-- Header + Filters -->
      <header class="flex flex-col md:flex-row md:items-end md:justify-between gap-4">
        <div>
          <slot name="header">
            <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold tracking-tight text-gray-900">Clinics & Institutions</h1>
            <p class="mt-2 text-base sm:text-lg text-gray-700">Find location, hours, and contact details.</p>
          </slot>
        </div>

        <div class="flex flex-col sm:flex-row gap-3">
          <slot name="filters">
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
            </select>
          </slot>
        </div>
      </header>

      <!-- Meta line -->
      <div class="mt-4">
        <slot name="meta">
          <p class="text-sm text-gray-600">Showing <span class="font-medium">0</span> institutions</p>
        </slot>
      </div>

      <!-- Grid/List -->
      <div class="mt-6">
        <slot name="grid">
          <!--
          Example (remove once you wire data):
          <div class="grid gap-6 sm:grid-cols-2">
            <article class="rounded-2xl border border-gray-200 bg-white p-5 shadow-sm">
              <div class="flex items-start justify-between gap-4">
                <div>
                  <h3 class="text-lg font-semibold text-gray-900">Healthway Clinic – BGC</h3>
                  <p class="mt-1 text-sm text-gray-600">Full-service outpatient clinic with child-friendly facilities.</p>
                </div>
                <NuxtLink to="/institutions/healthway-bgc"
                          class="hidden sm:inline-flex rounded-lg border border-gray-300 px-3 py-1.5 text-xs font-medium text-gray-800 hover:bg-gray-50">
                  Details
                </NuxtLink>
              </div>
              <div class="mt-4 grid gap-4 md:grid-cols-2 text-sm">
                <div class="space-y-1.5 text-gray-700">
                  <p><span class="font-medium">Address:</span> 9F Health Tower, 5th Ave, BGC, Taguig</p>
                  <p><span class="font-medium">Phone:</span> (+63) 917 123 4567</p>
                  <p><span class="font-medium">Email:</span> bgc@healthway.ph</p>
                </div>
                <div class="rounded-xl border border-gray-200 overflow-hidden">
                  <div class="h-40 bg-gray-100 flex items-center justify-center text-gray-400 text-xs">Map placeholder</div>
                </div>
              </div>
            </article>
          </div>
          -->
        </slot>
      </div>

      <!-- Empty state -->
      <div class="mt-10">
        <slot name="empty"></slot>
      </div>
    </div>
  </section>
</template>
