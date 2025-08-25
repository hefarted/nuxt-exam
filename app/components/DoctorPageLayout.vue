<script setup lang="ts">
/**
 * Layout-only wrapper for a doctor's profile page.
 * Slots:
 *  - hero-media: photo/portrait
 *  - hero-meta:  name, title, specialization, CTAs
 *  - overview:   long bio / content
 *  - sidebar:    affiliated clinics / quick actions
 */
</script>

<template>
  <section class="container pt-10 md:pt-14">
    <!-- Breadcrumbs -->
    <nav class="text-sm text-gray-600">
      <NuxtLink to="/" class="hover:underline">Home</NuxtLink>
      <span class="mx-1">›</span>
      <span class="text-gray-800">Doctors</span>
      <span class="mx-1">›</span>
      <slot name="crumb-current"><span class="text-gray-800">Doctor Name</span></slot>
    </nav>

    <!-- Hero -->
    <div class="mt-4 grid md:grid-cols-2 gap-8 items-start">
      <div class="rounded-2xl border border-gray-200 shadow-soft overflow-hidden bg-white min-h-[260px] flex items-center justify-center">
        <slot name="hero-media">
          <!-- Placeholder media -->
          <img src="/images/doctor-placeholder.svg" alt="Doctor" class="w-full h-auto" />
        </slot>
      </div>

      <div>
        <slot name="hero-meta">
          <!-- Placeholder meta -->
          <h1 class="text-3xl md:text-4xl font-bold tracking-tight">Dr. Jane Doe</h1>
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
        </slot>
      </div>
    </div>

    <!-- Body grid -->
    <div class="mt-10 grid lg:grid-cols-3 gap-8">
      <!-- Main content -->
      <article class="card p-6 lg:col-span-2">
        <slot name="overview">
          <h2 class="text-xl font-semibold">Overview</h2>
          <p class="mt-3 text-gray-700">
            Short doctor biography goes here. Replace this with real content later.
          </p>
          <h3 class="mt-6 font-semibold">Qualifications</h3>
          <ul class="mt-2 list-disc list-inside text-gray-700 text-sm">
            <li>Board-certified</li>
            <li>Professional memberships</li>
            <li>Years of experience</li>
          </ul>
        </slot>
      </article>

      <!-- Sidebar -->
      <aside class="space-y-6">
        <div class="card p-6">
          <slot name="sidebar">
            <h2 class="text-xl font-semibold">Affiliated Clinics</h2>
            <div class="mt-4 space-y-4">
              <div class="border-b last:border-0 border-gray-100 pb-4">
                <a class="font-medium hover:underline">Green Valley Medical Center</a>
                <p class="text-sm text-gray-600 mt-1">123 Green Ave, Mandaluyong</p>
                <div class="mt-2 flex flex-wrap gap-3 text-sm text-gray-600">
                  <span class="flex items-center gap-1"><img src="/images/icons/phone.svg" class="h-4 w-4" /> Call</span>
                  <span class="flex items-center gap-1"><img src="/images/icons/map-pin.svg" class="h-4 w-4" /> Directions</span>
                </div>
              </div>
            </div>
          </slot>
        </div>
      </aside>
    </div>
  </section>
</template>
