<script setup lang="ts">
// You can later connect this to an API or backend form handler
const form = reactive({
  name: '',
  email: '',
  message: ''
})

function submitForm() {
  // placeholder submit handler
  alert(`Form submitted by ${form.name} (${form.email})`)
}
</script>

<template>
  <div>
    <!-- Hero -->
    <section class="bg-gradient-to-b from-white to-gray-50">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-10 md:py-16 text-center">
        <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold tracking-tight text-gray-900">
          Contact Us
        </h1>
        <p class="mt-4 max-w-2xl mx-auto text-gray-600">
          Have questions or want to book an appointment? Get in touch with us below.
        </p>
      </div>
    </section>

    <!-- Contact Info + Form -->
    <section class="py-12 md:py-16 bg-white">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 grid gap-12 lg:grid-cols-2">
        <!-- Contact Details -->
        <div class="space-y-6">
          <div>
            <h2 class="text-xl font-semibold text-gray-900">Contact Information</h2>
            <p class="mt-2 text-gray-600">We’d love to hear from you.</p>
          </div>
        </div>

        <!-- Contact Form -->
        <form @submit.prevent="submitForm" class="bg-gray-50 p-6 rounded-2xl border border-gray-200 shadow-sm space-y-4">
          <div>
            <label class="block text-sm font-medium text-gray-700">Name</label>
            <input v-model="form.name" type="text" class="ui-input w-full" placeholder="Your name" required />
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700">Email</label>
            <input v-model="form.email" type="email" class="ui-input w-full" placeholder="you@example.com" required />
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700">Message</label>
            <textarea v-model="form.message" rows="4" class="ui-input w-full resize-none" placeholder="Your message..." required></textarea>
          </div>
          <button type="submit" class="ui-btn-primary w-full">
            Send Message
          </button>
        </form>
      </div>
    </section>

    <!-- Map -->
    <section class="bg-gray-50 py-12 md:py-16">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <h2 class="text-xl font-semibold text-gray-900">Our Location</h2>
        <div class="mt-4 rounded-xl border border-gray-200 overflow-hidden">
          <iframe
            title="Clinic location map"
            src="https://www.openstreetmap.org/export/embed.html?bbox=121.038%2C14.540%2C121.059%2C14.560&layer=mapnik&marker=14.5505%2C121.0490"
            class="h-96 w-full"
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"
          ></iframe>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
.ui-input {
  @apply rounded-xl border border-gray-300 bg-white px-3 py-2 text-sm
         text-gray-900 placeholder:text-gray-400
         focus:outline-none focus-visible:ring-2 focus-visible:ring-gray-300;
}
.ui-btn-primary {
  @apply inline-flex items-center justify-center rounded-xl bg-gray-900 px-5 py-3 text-sm font-semibold text-white hover:opacity-95;
}
</style>
