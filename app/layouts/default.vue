<script lang="ts">
import AppFooter from '~/components/AppFooter.vue';
import NavPrimary from '~/components/NavPrimary.vue';


</script>

<template>
    <div>
        <NavPrimary/>
        <slot/>
        <AppFooter/>
    </div>
</template>
