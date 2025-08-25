<script setup lang="ts">
/**
 * Reusable grid layout for the Doctors index page.
 * Slots:
 *  - header:   page title + intro
 *  - filters:  search / specialization controls
 *  - meta:     result count or supplementary info
 *  - grid:     your cards/grid items
 *  - empty:    empty state when no results
 *
 * Notes:
 * - Aligned to Home page container: max-w-7xl + px-4 sm:px-6 lg:px-8
 * - Section paddings: py-12 md:py-16 (same rhythm as your Home sections)
 * - Neutral focus rings to match your button style
 */
</script>

<template>
  <section class="py-12 md:py-16 bg-white">
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
      <!-- Header + Filters -->
      <header class="flex flex-col md:flex-row md:items-end md:justify-between gap-4">
        <div>
          <slot name="header">
            <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold tracking-tight text-gray-900">Doctors</h1>
            <p class="mt-2 text-base sm:text-lg text-gray-700">Find a doctor and view their full profile.</p>
          </slot>
        </div>

        <div class="flex flex-col sm:flex-row gap-3">
          <slot name="filters">
            <!-- Placeholder controls (no data binding) -->
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
            </select>
          </slot>
        </div>
      </header>

      <!-- Meta line -->
      <div class="mt-4">
        <slot name="meta">
          <p class="text-sm text-gray-600">
            Showing <span class="font-medium">0</span> doctors
          </p>
        </slot>
      </div>

      <!-- Grid slot (empty by default; no cards here) -->
      <div class="mt-6">
        <slot name="grid">
          <!--
          Add your grid here, e.g.:
          <div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            ...cards...
          </div>
          -->
        </slot>
      </div>

      <!-- Empty state slot -->
      <div class="mt-10">
        <slot name="empty">
          <!-- Optional empty state UI -->
        </slot>
      </div>
    </div>
  </section>
</template>
