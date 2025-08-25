<script setup lang="ts">
useHead({
  htmlAttrs: { lang: 'en' },
  titleTemplate: (t) => t ? `${t} · MedProfile` : 'MedProfile · Doctor Profiles & Clinics',
  meta: [
    { name: 'viewport', content: 'width=device-width, initial-scale=1' },
    { name: 'theme-color', content: '#111827' }
  ]
})
</script>

<template>
  <div class="min-h-dvh flex flex-col bg-white text-gray-900">
    <NavPrimary />

    <main id="main" class="flex-1">
      <slot />
    </main>

    <AppFooter>
      <template #phone>(+63) 917 123 4567</template>
      <template #email>dr.santos@clinic.ph</template>
      <template #address>9F Health Tower, Ayala Ave, Makati</template>
    </AppFooter>
  </div>
</template>
