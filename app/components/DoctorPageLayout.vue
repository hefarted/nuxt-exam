<script setup lang="ts">
/**
 * Aligned doctor profile layout
 * Slots:
 *  - crumb-current : text for the last breadcrumb
 *  - hero-media    : portrait / image (right column)
 *  - hero-meta     : name/title/spec/CTAs (left column)
 *  - overview      : main content (left in body grid)
 *  - sidebar       : clinics / actions (right in body grid)
 */
</script>

<template>
  <!-- HERO (same container & spacing as your index hero) -->
  <section class="bg-white">
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-10 md:py-16">
      <!-- Breadcrumbs -->
      <nav class="text-sm text-gray-600">
        <NuxtLink to="/" class="hover:underline">Home</NuxtLink>
        <span class="mx-1">›</span>
        <span class="text-gray-800">Doctors</span>
        <span class="mx-1">›</span>
        <slot name="crumb-current">
          <span class="text-gray-800">Doctor Name</span>
        </slot>
      </nav>

      <!-- Grid matches index: md:grid-cols-5; left 3, right 2 -->
      <div class="mt-4 grid gap-8 md:grid-cols-5 items-start">
        <!-- LEFT: meta -->
        <div class="md:col-span-3">
          <slot name="hero-meta">
            <div class="inline-flex items-center gap-2 rounded-full bg-gray-100 px-3 py-1 text-xs font-medium text-gray-700">
              Trusted Care
            </div>
            <h1 class="mt-4 text-3xl sm:text-4xl md:text-5xl font-bold tracking-tight text-gray-900">
              Dr. Jane Doe
            </h1>
            <p class="mt-2 text-base sm:text-lg text-gray-700">
              MD, FPCP · Cardiology
            </p>
            <p class="mt-4 text-gray-600 max-w-2xl">
              Short biography goes here. Replace this placeholder with real content.
            </p>
            <div class="mt-6 flex flex-wrap items-center gap-3">
              <button class="inline-flex items-center justify-center rounded-xl bg-gray-900 px-5 py-3 text-sm font-semibold text-white hover:opacity-95 focus:outline-none focus-visible:ring-2 focus-visible:ring-gray-400">
                Book an Appointment
              </button>
              <button class="inline-flex items-center justify-center rounded-xl border border-gray-300 px-5 py-3 text-sm font-semibold text-gray-800 hover:bg-gray-50">
                Call Clinic
              </button>
            </div>
            <p class="mt-3 text-xs text-gray-500">
              Serving families in BGC and Makati.
            </p>
          </slot>
        </div>

        <!-- RIGHT: media -->
        <div class="md:col-span-2">
          <div class="mx-auto aspect-[4/3] w-full max-w-md overflow-hidden rounded-2xl border border-gray-200 bg-white shadow-sm">
            <slot name="hero-media">
              <img src="/images/doctor-placeholder.svg" alt="Doctor portrait" class="h-full w-full object-cover" />
            </slot>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- BODY (aligned to your section rhythm) -->
  <section class="bg-white">
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 mt-12">
      <div class="grid gap-8 lg:grid-cols-3">
        <!-- Main content -->
        <article class="rounded-2xl border border-gray-200 bg-white p-6 shadow-sm lg:col-span-2">
          <slot name="overview">
            <h2 class="text-xl font-semibold">Overview</h2>
            <p class="mt-3 text-gray-700">
              Replace with the doctor’s full biography and details.
            </p>
          </slot>
        </article>

        <!-- Sidebar -->
        <aside>
          <div class="rounded-2xl border border-gray-200 bg-white p-6 shadow-sm">
            <slot name="sidebar">
              <h2 class="text-xl font-semibold">Affiliated Clinics</h2>
              <div class="mt-4 space-y-4">
                <div class="border-b last:border-0 border-gray-100 pb-4">
                  <span class="font-medium">Clinic name</span>
                  <p class="text-sm text-gray-600 mt-1">Clinic address here</p>
                </div>
              </div>
            </slot>
          </div>
        </aside>
      </div>
    </div>
  </section>
</template>
